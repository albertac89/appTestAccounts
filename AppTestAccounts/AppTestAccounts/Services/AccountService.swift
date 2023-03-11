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
    
    /// Inejcts the dependencies needed for `AccountService`.
    ///
    /// - Parameters:
    ///     - client: The client to calll the services needed`.
    ///     - networkMonitor: A `Class` that conforms the protocol`NetworkMonitorProtocol`.
    ///     - accountPercistanceManager: A `Class` that conforms the protocol`AccountPercistanceManagerProtocol`.
    ///     - errorHandler: A `Class` that conforms the protocol`ErrorHandlerProtocol`.
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
    /// Does the service call to obtain the accounts.
    ///
    /// - Returns: A `Publisher` to observe the service completion.
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
            .tryMap { [errorHandler] (data: Data, response: URLResponse) in
                try errorHandler.checkError(data: data, response: response)
                return data
            }
            .decode(type: [Account].self, decoder: JSONDecoder())
            .compactMap({ [accountPercistanceManager] accounts in
                accountPercistanceManager.saveLastAccountsToCoreData(accounts: accounts)
                return accounts
            })
            .share()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
