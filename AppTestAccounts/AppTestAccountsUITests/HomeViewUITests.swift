//
//  HomeViewUITests.swift
//  AppTestAccountsUITests
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import XCTest

final class HomeViewUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_texts() throws {
        let welcome = app.staticTexts["Welcome"]
        let companyName = app.staticTexts["Company name"]
        let yourCurrencies = app.staticTexts["Your currencies"]
         
        XCTAssert(welcome.exists)
        XCTAssert(companyName.exists)
        XCTAssert(yourCurrencies.exists)
    }
}
