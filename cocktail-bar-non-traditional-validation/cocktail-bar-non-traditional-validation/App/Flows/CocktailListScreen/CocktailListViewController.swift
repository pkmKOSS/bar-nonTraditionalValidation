//
//  TableViewController.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import UIKit

/// Экран со списком коктейлей.
final class CocktailListViewController: UITableViewController {

    // MARK: - Constants

    private enum Constants {
        static let cellIdentifier = "CocktailCell"
    }

    // MARK: - Private properties

    private let networkService = NetworkService()
    private var cocktails: [Cocktail] = []

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }

    // MARK: - Public delegates and dataSource methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cocktails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(
                withIdentifier: Constants.cellIdentifier
            ) as? CocktailCell
        else { return UITableViewCell() }
        cell.configure(
            drink: cocktails[indexPath.row]
        )
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCocktailIngredients(cocktails[indexPath.row].id)
    }

    // MARK: - Private methods

    private func setupScreen() {
        setupTableView()
        fetchCatalog()
    }

    private func fetchCatalog() {
        networkService.fetchMenu { [weak self] cocktail in
            guard let self = self else { return }
            switch cocktail {
            case let .success(data):
                self.cocktails = data.drinks
                self.tableView.reloadData()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func showCocktailIngredients(_ cocktailID: String) {
        let cocktailDescriptionViewController = CocktailDescriptionViewController()
        cocktailDescriptionViewController.id = cocktailID
        navigationController?.pushViewController(cocktailDescriptionViewController, animated: true)
    }

    private func setupTableView() {
        tableView.register(
            CocktailCell.self,
            forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
}
