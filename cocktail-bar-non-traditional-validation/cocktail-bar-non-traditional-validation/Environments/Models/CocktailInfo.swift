//
//  Details.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Foundation

/// Описание коктейля
struct CocktailInfo: Decodable {
    /// Название коктейля
    let name: String
    /// Фото коктейля
    let photo: String
    /// Ингредиент 1
    let ingredient1: String?
    /// Ингредиент 2
    let ingredient2: String?
    /// Ингредиент 3
    let ingredient3: String?
    /// Ингредиент 4
    let ingredient4: String?
    /// Ингредиент 5
    let ingredient5: String?

    private enum CodingKeys: String, CodingKey {
        case photo = "strDrinkThumb"
        case name = "strDrink"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
    }
}
