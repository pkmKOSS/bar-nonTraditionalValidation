//
//  AppDelegate.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import UIKit

/// Апп делегат
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController = UINavigationController()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let viewController = CocktailListViewController()
        navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}
