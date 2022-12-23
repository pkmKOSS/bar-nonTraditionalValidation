//
//  NetworkServiceProtocol.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Foundation

/// Сетевой сервис
protocol NetworkServiceProtocol {
    func fetchCocktailFormula(id: String, completion: @escaping (Result<CocktailsMenu, Error>) -> Void)
    func fetchMenu(completion: @escaping (Result<Cocktails, Error>) -> Void)
}
