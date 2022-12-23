//
//  NetworkService.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Foundation

/// Сетевой запрос
enum NetworkRequests {
    // MARK: - Constants

    private enum Constants {
        static let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
        static let coctailDetailPath = "lookup.php?i="
        static let coctailMenuPath = "filter.php?c=Cocktail"
    }

    case coctailsMenu
    case coctailsDetails(coctailId: String)

    // MARK: - Public Properties

    var urlPath: String {
        switch self {
        case let .coctailsDetails(coctailId):
            return "\(Constants.baseURL)\(Constants.coctailDetailPath)\(coctailId)"
        case .coctailsMenu:
            return "\(Constants.baseURL)\(Constants.coctailMenuPath)"
        }
    }
}
