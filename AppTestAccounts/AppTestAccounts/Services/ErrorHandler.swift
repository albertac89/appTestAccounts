//
//  ErrorHandler.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 9/3/23.
//

import Foundation

protocol ErrorHandlerProtocol {
    func handleError(data: Data, response: URLResponse?) throws
}

final class ErrorHandler: ErrorHandlerProtocol {
    func handleError(data: Data, response: URLResponse?) throws {
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        let apiError = try? decoder.decode(APIErrorMessage.self, from: data)
        if let error = apiError, error.response == "Error" {
            throw APIError.genericError(error.message)
        }
    }
}
