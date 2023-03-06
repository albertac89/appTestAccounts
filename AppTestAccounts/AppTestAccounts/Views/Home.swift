//
//  Home.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct Home: View {
    let accounts: [Account]
    var body: some View {
        VStack {
            HomeBanner()
            Spacer()
            Currencies(accounts: accounts)
                .padding(.top, -60)
            BottomNavigation()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(accounts: [Account(accountId: "3230bd7e-cb4c-553c-bcd3-607f3a3f8e20",
                                          companyName: "Business Example LTD",
                                          amount: Amount(amount: "198395.3700",
                                                         currency: "USD", currencyName: "US Dollars"),
                                          creditDebitIndicator: "Credit",
                                          datetime: "2022-08-08T15:44:45.294"),
                                  Account(accountId: "3230bd7e-cb4c-553c-bcd",
                                          companyName: "Business Example LTD",
                                          amount: Amount(amount: "123.3700",
                                                         currency: "EUR", currencyName: "Euro"),
                                          creditDebitIndicator: "Credit",
                                          datetime: "2022-08-08T15:44:45.294"),
                                Account(accountId: "3230b553c-bcd",
                                        companyName: "Business Example LTD",
                                        amount: Amount(amount: "99993.3700",
                                                       currency: "GBP", currencyName: "British Pound"),
                                        creditDebitIndicator: "Credit",
                                        datetime: "2022-08-08T15:44:45.294")])
    }
}
