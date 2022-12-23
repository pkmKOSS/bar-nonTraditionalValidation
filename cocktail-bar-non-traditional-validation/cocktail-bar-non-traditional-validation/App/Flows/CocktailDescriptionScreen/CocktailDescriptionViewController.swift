//
//  CocktailDescriptionViewController.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import UIKit

/// Экран описания коктейля.
final class CocktailDescriptionViewController: UITableViewController {

    // MARK: - Private constants

    private enum Constants {
        static let emptyString = ""
    }

    // MARK: - Visual Components

    private var cocktailNameLabel = UILabel()
    private var cocktailImageView = UIImageView()

    // MARK: - Public properties

    var id = Constants.emptyString

    // MARK: - Private Properties

    private let networkService = NetworkService()
    private var ingredients: [String?] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }

    // MARK: Public delegates and dataSource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }

    // MARK: - Private Methods

    private func setupScreen() {
        setupUI()
        fetchCocktailFormula()
    }

    private func fetchCocktailFormula() {
        networkService.fetchCocktailFormula(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.getIngredients(data: data)
                self.tableView.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func setupUI() {
        view.backgroundColor = .white
    }

    private func getIngredients(data: CocktailsMenu) {
        for coctail in data.cocktails {
            ingredients.append(coctail.ingredient1)
            ingredients.append(coctail.ingredient2)
            ingredients.append(coctail.ingredient3)
            ingredients.append(coctail.ingredient4)
            ingredients.append(coctail.ingredient5)
        }
    }
}
