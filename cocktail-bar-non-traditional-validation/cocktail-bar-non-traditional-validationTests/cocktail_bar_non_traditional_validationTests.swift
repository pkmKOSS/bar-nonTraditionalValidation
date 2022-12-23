// swiftlint:disable all
//  cocktail_bar_non_traditional_validationTests.swift
//  cocktail-bar-non-traditional-validationTests
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import XCTest
@testable import cocktail_bar_non_traditional_validation

/// Тесты
final class NontraditionalValidationTests: XCTestCase {

    // MARK: - private constants

    private enum Constants {
        static let defaultName = "Name"
        static let defaultPhoto = "Photo"
        static let defaultID = "ID"
        static let emptyString = ""
    }

    // MARK: - Private properties
    private let id = Constants.defaultID
    private var networkService: NetworkServiceProtocol?
    private let cocktail = Cocktails(drinks: [Cocktail(
        id: Constants.defaultID,
        photo: Constants.defaultPhoto,
        name: Constants.defaultName
    )])
    private let cocktailFormula = CocktailsMenu(cocktails: [CocktailInfo(
        name: Constants.defaultName,
        photo: Constants.defaultPhoto,
        ingredient1: nil,
        ingredient2: nil,
        ingredient3: nil,
        ingredient4: nil,
        ingredient5: nil
    )])

    // MARK: - Public methods

    override func tearDown() {
        networkService = nil
    }

    func testFetchCocktailFormula() {
        networkService = MockNetworkService(cocktailsMenu: cocktailFormula)
        XCTAssertNotNil(networkService)
        var drinkDetails: CocktailsMenu?
        networkService?.fetchCocktailFormula(id: id, completion: { result in
            switch result {
                case let .success(drink):
                    drinkDetails = drink
                case let .failure(error):
                    print(error.localizedDescription)
            }
        })
        XCTAssertNotEqual(drinkDetails?.cocktails.count, 0)
    }

    func testFetchMenu() throws {
        var cocktails: Cocktails?
        networkService = MockNetworkService(cocktails: cocktail)
        XCTAssertNotNil(networkService)
        networkService?.fetchMenu { result in
            switch result {
            case let .success(cocktail):
                cocktails = cocktail
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        XCTAssertNotEqual(cocktails?.drinks.count, 0)
    }
}

/// Моковый класс сетевого сервиса
final class MockNetworkService: NetworkServiceProtocol {

    // MARK: - private constants

    private enum Constants {
        static let defaultErrorCode = 500
        static let defaultPhoto = "Photo"
        static let defaultID = "ID"
        static let emptyString = ""
    }
    
    // MARK: - Public Properties

    var cocktail: Cocktails?
    var cocktailsMenu: CocktailsMenu?

    // MARK: - Initializers

    init() {}

    convenience init(cocktails: Cocktails) {
        self.init()
        self.cocktail = cocktails
    }

    convenience init(cocktailsMenu: CocktailsMenu) {
        self.init()
        self.cocktailsMenu = cocktailsMenu
    }

    // MARK: - Public methods

    func fetchMenu(completion: @escaping (Result<Cocktails, Error>) -> Void) {
        if let cocktails = cocktail {
            completion(.success(cocktails))
        } else {
            let error = NSError(domain: Constants.emptyString, code: Constants.defaultErrorCode, userInfo: nil)
            completion(.failure(error))
        }
    }

    func fetchCocktailFormula(id: String, completion: @escaping (Result<CocktailsMenu, Error>) -> Void) {
        if let cocktailsFormula = cocktailsMenu {
            completion(.success(cocktailsFormula))
        } else {
            let error = NSError(domain: Constants.emptyString, code: Constants.defaultErrorCode, userInfo: nil)
            completion(.failure(error))
        }
    }
}
