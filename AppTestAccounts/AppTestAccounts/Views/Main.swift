//
//  Main.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct Main: View {
    @ObservedObject var viewModel: MainViewModel
    let accounts: [Account]
    var body: some View {
        VStack {
            switch viewModel.navState {
            case .home:
                Home(accounts: accounts)
                    .transition(.asymmetric(insertion: .move(edge: .leading),
                                            removal: .move(edge: .trailing)))
            case .products:
                Products()
                    .transition(.asymmetric(insertion: .move(edge: .leading),
                                            removal: .move(edge: .trailing)))
            }
            BottomNavigation(mainViewModel: viewModel)
                .background(Color("itemBackgound"))
                .edgesIgnoringSafeArea(.bottom)
        }.background(
            Image("backgoundImage").resizable()
        ).edgesIgnoringSafeArea(.top)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(viewModel: MainViewModel(), accounts: [Account(accountId: "3230bd7e-cb4c-553c-bcd3-607f3a3f8e20",
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
