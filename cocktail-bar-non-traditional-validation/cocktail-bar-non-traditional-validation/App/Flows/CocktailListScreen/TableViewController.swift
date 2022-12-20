//
//  TableViewController.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import UIKit

/// Экран со списком коктейлей.
class CocktailListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Меню"
        tableView.register(CocktailCell.self, forCellReuseIdentifier: "CocktailCell")
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CocktailDescriptionViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailCell")
                as? CocktailCell else { return UITableViewCell() }
        cell.configure()
        return cell
    }
}
