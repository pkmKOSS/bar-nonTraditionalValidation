//
//  NetworkService.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Alamofire
import Foundation

/// Реализация сетевого сервиса
final class NetworkService: NetworkServiceProtocol {

    // MARK: - Public methods

    func fetchMenu(completion: @escaping (Result<Cocktails, Error>) -> Void) {
        downloadData(urlPath: NetworkRequests.coctailsMenu.urlPath, completion: completion)
    }

    func fetchCocktailFormula(id: String, completion: @escaping (Result<CocktailsMenu, Error>) -> Void) {
        downloadData(urlPath: NetworkRequests.coctailsDetails(coctailId: id).urlPath, completion: completion)
    }

    // MARK: - Private properties

    private func downloadData<T: Decodable>(
        urlPath: String,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        AF.request(urlPath).responseJSON { response in
            guard let value = response.data else { return }
            do {
                let data = try JSONDecoder().decode(T.self, from: value)
                completion(.success(data))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
