//
//  ErrorHandlerMock.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

@testable import AppTestAccounts
import Foundation

final class ErrorHandlerMock: ErrorHandlerProtocol {
    var checkErrorCount = 0
    func checkError(data: Data, response: URLResponse?) throws {
        checkErrorCount += 1
    }
}
