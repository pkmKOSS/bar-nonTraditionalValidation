//
//  CocktailCell.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import UIKit

/// Ячейка с коктейлем
final class CocktailCell: UITableViewCell {
    // MARK: - Private Properties

        private let photoCacheService = PhotoCacheService()

        // MARK: - Public Methods

        func configure(drink: Cocktail) {
            textLabel?.text = drink.name
            imageView?.image = photoCacheService.photo(byUrl: drink.photo)
        }
}
