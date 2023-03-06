//
//  Accounts.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import Foundation

struct Account: Codable {
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
}

struct Amount: Codable {
    let amount: String
    let currency: String
    let currencyName: String
}
