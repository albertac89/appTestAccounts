//
//  HomeViewModelTests.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

import XCTest
@testable import AppTestAccounts

final class HomeViewModelTests: XCTestCase {
    private let accountService = AccountServiceMock()
    private var sut: HomeViewModel?
    
    override func setUpWithError() throws {
        sut = HomeViewModel(accountService: accountService)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getAccounts() {
        guard let sut = sut else {
            XCTFail("Expected non-nil sut")
            return
        }
        
        // Initial values
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.showError)
        XCTAssertEqual(sut.errorMessage, "")
        XCTAssertTrue(sut.accounts.isEmpty)
        XCTAssertEqual(accountService.getAccountsCount, 0)
        
        // Load accounts
        sut.getAccounts()
        
        // Check
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.showError)
        XCTAssertEqual(sut.errorMessage, "")
        XCTAssertFalse(sut.accounts.isEmpty)
        XCTAssertEqual(accountService.getAccountsCount, 1)
    }
    
    func test_showAllAcountsIfNeeded_viewAll_false() {
        guard let sut = sut else {
            XCTFail("Expected non-nil sut")
            return
        }
        
        // Initial values
        XCTAssertEqual(sut.viewAllText, "View all")
        XCTAssertFalse(sut.viewAll)
        XCTAssertTrue(sut.accounts.isEmpty)
        
        // Load accounts
        sut.getAccounts()
        
        
        // Check case 3 accounts
        XCTAssertFalse(sut.accounts.isEmpty)
        XCTAssertEqual(sut.accounts.count, 3)
        XCTAssertEqual(sut.viewAllText, "View all")
        
        // viewAll true
        sut.viewAll = true
        sut.showAllAcountsIfNeeded()
        
        // Check case more than 3 accounts
        XCTAssertFalse(sut.accounts.isEmpty)
        XCTAssertTrue(sut.accounts.count > 3)
        XCTAssertEqual(sut.viewAllText, "View less")
    }
    
    func test_showAllAcountsIfNeeded_viewAll_true() {
        guard let sut = sut else {
            XCTFail("Expected non-nil sut")
            return
        }
        
        // Initial values
        XCTAssertEqual(sut.viewAllText, "View all")
        XCTAssertFalse(sut.viewAll)
        XCTAssertTrue(sut.accounts.isEmpty)
        
        // Load accounts with viewAll true
        sut.viewAll = true
        sut.getAccounts()
        
        
        // Check case more than 3 accounts
        XCTAssertFalse(sut.accounts.isEmpty)
        XCTAssertTrue(sut.accounts.count > 3)
        XCTAssertEqual(sut.viewAllText, "View less")
        
        // viewAll false
        sut.viewAll = false
        sut.showAllAcountsIfNeeded()
        
        // Check case 3 accounts
        XCTAssertFalse(sut.accounts.isEmpty)
        XCTAssertEqual(sut.accounts.count, 3)
        XCTAssertEqual(sut.viewAllText, "View all")
    }
}
