//
//  AccountServiceMock.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

@testable import AppTestAccounts
import Combine

final class AccountServiceMock: AccountServiceProtocol {
    var getAccountsCount = 0
    func getAccounts() -> AnyPublisher<[Account], Error> {
        getAccountsCount += 1
        return Just(AccountsMock.service).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
