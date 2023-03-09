//
//  HomeViewModelBuilder.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 9/3/23.
//

import Foundation

final class HomeViewModelBuilder {
    static let shared = HomeViewModelBuilder()
    func build() -> HomeViewModel {
        let client = URLSession.shared
        let networkMonitor = NetworkMonitor()
        let percistanceManager = AccountPercistanceManager()
        let service = AccountService(client: client,
                                     networkMonitor: networkMonitor,
                                     accountPercistanceManager: percistanceManager,
                                     errorHandler: ErrorHandler())
        return HomeViewModel(accountService: service)
    }
}
