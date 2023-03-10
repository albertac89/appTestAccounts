//
//  NetworkMonitorMock.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

@testable import AppTestAccounts

final class NetworkMonitorMock: NetworkMonitorProtocol {
    var isNetworkAvailable: Bool = false
    
    /// Sets the var isNetworkAvailable to execute the tests accordingly.
    ///
    /// - Parameters:
    ///     - isNetworkAvailable: Whether the network is available.
    init(isNetworkAvailable: Bool) {
        self.isNetworkAvailable = isNetworkAvailable
    }
}
