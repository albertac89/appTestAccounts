//
//  ErrorHandler.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 9/3/23.
//

import Foundation

protocol ErrorHandlerProtocol {
    func checkError(data: Data, response: URLResponse?) throws
}

final class ErrorHandler: ErrorHandlerProtocol {
    /// Checks whether there is an erro with the service response and throws an erro if needed.
    ///
    /// - Parameters:
    ///     - data: The `Data`from the service.
    ///     - response: `URLResponse` from the service.
    func checkError(data: Data, response: URLResponse?) throws {
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
    }
}
