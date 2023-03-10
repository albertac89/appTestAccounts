//
//  AccountServiceTests.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

import XCTest
import Combine
@testable import AppTestAccounts

final class AccountServiceTests: XCTestCase {
    private var sut: AccountService?
    private let client = URLSessionMock.mock
    private var networkMonitor = NetworkMonitorMock(isNetworkAvailable: true)
    private let accountPercistanceManager = AccountPercistanceManagerMock()
    private let errorHandler = ErrorHandlerMock()
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        URLProtocol.registerClass(URLProtocolMock.self)
        guard let accountsListMock = MockedData.forFile(name: "accounts") else {
            XCTFail("Mock response not loaded")
            return
        }
        URLProtocolMock.mockData["/accounts"] = accountsListMock
        sut = AccountService(client: client,
                             networkMonitor: networkMonitor,
                             accountPercistanceManager: accountPercistanceManager,
                             errorHandler: errorHandler)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func test_getAccounts_isNetworkAvailable_true() {
        guard let sut = sut else {
            XCTFail("Expected non-nil sut")
            return
        }
        let expectation = XCTestExpectation()
        networkMonitor.isNetworkAvailable = true
        
        // Initial vaues
        XCTAssertEqual(accountPercistanceManager.loadAccountsFromCoreDataCount, 0)
        XCTAssertEqual(accountPercistanceManager.saveLastAccountsToCoreDataCount, 0)
        XCTAssertEqual(errorHandler.checkErrorCount, 0)
        
        // Call service
        var accounts = [Account]()
        sut.getAccounts().sink { completion in
            expectation.fulfill()
        } receiveValue: { accountsMock in
            // Save service result
            accounts = accountsMock
        }.store(in: &cancellables)

        wait(for: [expectation], timeout: 1)
        
        // Check
        XCTAssertEqual(accountPercistanceManager.loadAccountsFromCoreDataCount, 0)
        XCTAssertEqual(accountPercistanceManager.saveLastAccountsToCoreDataCount, 1)
        XCTAssertEqual(errorHandler.checkErrorCount, 1)
        XCTAssertEqual(accounts, AccountsMock.service)
    }
    
    func test_getAccounts_isNetworkAvailable_false() {
        guard let sut = sut else {
            XCTFail("Expected non-nil sut")
            return
        }
        let expectation = XCTestExpectation()
        networkMonitor.isNetworkAvailable = false
        
        // Initial vaues
        XCTAssertEqual(accountPercistanceManager.loadAccountsFromCoreDataCount, 0)
        XCTAssertEqual(accountPercistanceManager.saveLastAccountsToCoreDataCount, 0)
        XCTAssertEqual(errorHandler.checkErrorCount, 0)
        
        // Call service
        var accounts = [Account]()
        sut.getAccounts().sink { completion in
            expectation.fulfill()
        } receiveValue: { accountsMock in
            // Save service result
            accounts = accountsMock
        }.store(in: &cancellables)

        wait(for: [expectation], timeout: 1)
        
        // Check
        XCTAssertEqual(accountPercistanceManager.loadAccountsFromCoreDataCount, 1)
        XCTAssertEqual(accountPercistanceManager.saveLastAccountsToCoreDataCount, 0)
        XCTAssertEqual(errorHandler.checkErrorCount, 0)
        XCTAssertEqual(accounts, AccountsMock.coreData)
    }
}
