//
//  Accounts.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import Foundation

struct Account: Codable, Equatable {
    let accountId: String
    let companyName: String
    let amount: Amount
    let creditDebitIndicator: String
    let datetime: String
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case companyName = "company_name"
        case amount = "amount"
        case creditDebitIndicator = "credit_debit_indicator"
        case datetime = "datetime"
    }
    
    static func == (lhs: Account, rhs: Account) -> Bool {
        lhs.accountId == rhs.accountId
    }
}

struct Amount: Codable {
    let amount: String
    let currency: String
    let currencyName: String
    
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case currency = "currency"
        case currencyName = "currency_name"
    }
}

extension Amount {
    /// Encodes the `Amount` of an `Account` to store it in `Core Data`.
    ///
    /// - Returns: `Data` to save in `Core Data` as `Binary Data`.
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch { print(error) }
        return nil
    }
    
    /// Decodes a `Binary Data` from `Core Data` to load it to the `Amount` of an `Account`.
    ///
    /// - Parameters:
    ///     - amountData: The `Binary Data`  from an entity of `Core Data`.
    ///
    /// - Returns: An `Amount`.
    static func decode(_ amountData: Data?) -> Amount? {
        do {
            return try JSONDecoder().decode(Amount.self, from: amountData ?? Data())
        } catch { print(error) }
        return nil
    }
}
