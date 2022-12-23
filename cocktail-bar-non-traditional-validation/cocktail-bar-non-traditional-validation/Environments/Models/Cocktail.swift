//
//  Drink.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Foundation

/// Коктейль
struct Cocktail: Decodable {
    /// Id коктейля
    let id: String
    /// Фото коктейля
    let photo: String
    /// Название коктейля
    let name: String

    private enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case photo = "strDrinkThumb"
        case name = "strDrink"
    }
}
