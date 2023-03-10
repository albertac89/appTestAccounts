//
//  ProductsViewUITests.swift
//  AppTestAccountsUITests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

import XCTest

final class ProductsViewUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_texts() throws {
        app.buttons["Products"].tap()
        
        let products = app.staticTexts["Products"]
        let comingSoon = app.staticTexts["Coming soon"]
        let descritpion = app.staticTexts["We are currently working in more features to offer the best experience"]
        
        XCTAssert(products.waitForExistence(timeout: 0.5))
        XCTAssert(comingSoon.waitForExistence(timeout: 0.5))
        XCTAssert(descritpion.waitForExistence(timeout: 0.5))
    }
}
