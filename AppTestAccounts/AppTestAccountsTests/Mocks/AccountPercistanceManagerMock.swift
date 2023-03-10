//
//  AccountPercistanceManagerMock.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

@testable import AppTestAccounts

final class AccountPercistanceManagerMock: AccountPercistanceManagerProtocol {
    var saveLastAccountsToCoreDataCount = 0
    var loadAccountsFromCoreDataCount = 0
    
    func saveLastAccountsToCoreData(accounts: [Account]) {
        saveLastAccountsToCoreDataCount += 1
    }
    
    func loadAccountsFromCoreData() -> [Account]? {
        loadAccountsFromCoreDataCount += 1
        return AccountsMock.coreData
    }
}
