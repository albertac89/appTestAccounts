//
//  BottomNavigationViewUITests.swift
//  AppTestAccountsUITests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

import XCTest

final class BottomNavigationViewUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_buttons() throws {
        let home = app.buttons["Home"]
        let products = app.buttons["Products"]
         
        XCTAssert(home.exists)
        XCTAssert(products.exists)
    }
}
