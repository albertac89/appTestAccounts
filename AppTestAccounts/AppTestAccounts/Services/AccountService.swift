//
//  AccountService.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import Combine
import CoreData

protocol AccountServiceProtocol {
    func getAccounts() -> AnyPublisher<[Account], Error>
}

final class AccountService {
    private var client: URLSession
    private var networkMonitor: NetworkMonitorProtocol
    private var accountPercistanceManager: AccountPercistanceManagerProtocol
    private var errorHandler: ErrorHandlerProtocol
    
    init(client: URLSession,
         networkMonitor: NetworkMonitorProtocol,
         accountPercistanceManager: AccountPercistanceManagerProtocol,
         errorHandler: ErrorHandlerProtocol) {
        self.client = client
        self.networkMonitor = networkMonitor
        self.accountPercistanceManager = accountPercistanceManager
        self.errorHandler = errorHandler
    }
}

extension AccountService: AccountServiceProtocol {
   
    func getAccounts() -> AnyPublisher<[Account], Error> {
        if !networkMonitor.isNetworkAvailable {
            guard let accountsCached = accountPercistanceManager.loadAccountsFromCoreData() else {
                return Fail(error: APIError.cachedDataError).eraseToAnyPublisher()
            }
            return Just(accountsCached).setFailureType(to: Error.self).eraseToAnyPublisher()
        }
        guard let urlAccounts = URL(string: "https://6l221.wiremockapi.cloud/accounts") else {
            return Fail(error: APIError.invalidUrl).eraseToAnyPublisher()
        }
        return client.dataTaskPublisher(for: urlAccounts)
            .tryMap { (data: Data, response: URLResponse) in
                try self.errorHandler.handleError(data: data, response: response)
                return data
            }
            .decode(type: [Account].self, decoder: JSONDecoder())
            .compactMap({ accounts in
                self.accountPercistanceManager.saveLastAccountsToCoreData(accounts: accounts)
                return accounts
            })
            .share()
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
