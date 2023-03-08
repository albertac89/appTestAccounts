//
//  AccountService.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import Combine
import Foundation

protocol AccountServiceProtocol {
    func getAccounts() -> AnyPublisher<[Account], Error>
}

class AccountService {
    var client: URLSession
    
    init(client: URLSession) {
        self.client = client
    }
}

extension AccountService: AccountServiceProtocol {
    func getAccounts() -> AnyPublisher<[Account], Error> {
        guard let urlAccounts = URL(string: "https://6l221.wiremockapi.cloud/accounts") else {
            return Fail(error: APIError.invalidUrl).eraseToAnyPublisher()
        }
        return client.dataTaskPublisher(for: urlAccounts)
            .tryMap { (data: Data, response: URLResponse) in
                try self.handleErrors(data: data, response: response)
                return data
            }
            .decode(type: [Account].self, decoder: JSONDecoder())
            .share()
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

private extension AccountService {
    func handleErrors(data: Data, response: URLResponse?) throws {
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
