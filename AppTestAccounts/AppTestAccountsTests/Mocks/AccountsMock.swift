//
//  AccountsMock.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

@testable import AppTestAccounts

struct AccountsMock {
    static var service: [Account] {
        [Account(accountId: "0",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test"),
                       Account(accountId: "1",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test"),
                       Account(accountId: "2",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test"),
                       Account(accountId: "3",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test"),
                       Account(accountId: "4",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test"),
                       Account(accountId: "5",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test"),
                       Account(accountId: "6",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test"),
                       Account(accountId: "7",
                               companyName: "test",
                               amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                               creditDebitIndicator: "test",
                               datetime: "test")]
    }
    
    static var coreData: [Account] {
        [Account(accountId: "0",
                 companyName: "test",
                 amount: Amount(amount: "0.0", currency: "test", currencyName: "test"),
                 creditDebitIndicator: "test",
                 datetime: "test")]
    }
}
