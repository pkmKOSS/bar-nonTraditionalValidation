//
//  CocktailCell.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import UIKit

/// Ячейка с коктейлем
class CocktailCell: UITableViewCell {
    let cocktailImageView = UIImageView(image: UIImage(named: "some"))

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure() {
        setupImage()
        setupLabel()
    }

    func setupImage() {
        self.contentView.addSubview(cocktailImageView)
        cocktailImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cocktailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cocktailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cocktailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cocktailImageView.heightAnchor.constraint(equalToConstant: 150),
            cocktailImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    func setupLabel() {
        let label = UILabel()
        label.text = "Дайкири"
        self.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cocktailImageView.trailingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 150),
            label.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
