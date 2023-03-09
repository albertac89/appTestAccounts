//
//  Api.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import Foundation

enum APIError: LocalizedError {
    case invalidUrl
    case invalidResponse
    case genericError(String)
    case cachedDataError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .genericError(let message):
            return message
        case .cachedDataError:
            return "Error retriving the catched data"
        }
    }
}

struct APIErrorMessage: Codable {
    let response: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case message = "Message"
    }
}
