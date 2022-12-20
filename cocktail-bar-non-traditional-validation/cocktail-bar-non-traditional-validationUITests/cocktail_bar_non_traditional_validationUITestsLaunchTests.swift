// swiftlint:disable all
//  cocktail_bar_non_traditional_validationUITestsLaunchTests.swift
//  cocktail-bar-non-traditional-validationUITests
//
//  Created by Григоренко Александр Игоревич on 20.12.2022.
//

import XCTest

final class cocktail_bar_non_traditional_validationUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
