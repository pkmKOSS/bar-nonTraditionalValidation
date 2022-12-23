//
//  DrinksDetails.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Foundation

/// Список ингредиентов
struct CocktailsMenu: Decodable {
    /// коктейли
    let cocktails: [CocktailInfo]

    private enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
}
