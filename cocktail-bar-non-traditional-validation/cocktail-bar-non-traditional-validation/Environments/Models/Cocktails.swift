//
//  Drinks.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Foundation

/// Список коктейлей
struct Cocktails: Decodable {
    /// коктейли
    let drinks: [Cocktail]
}
