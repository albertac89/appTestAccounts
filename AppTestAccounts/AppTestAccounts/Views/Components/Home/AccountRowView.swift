//
//  AccountRowView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct AccountRowView: View {
    let account: Account
    @Environment(\.colorScheme) var colorScheme
    struct Constants {
        static let flagIconSize: CGFloat = 32
        static let rowPadding: CGFloat = 16
    }

    var body: some View {
        HStack {
            Image(account.amount.currency)
                .resizable()
                .frame(maxWidth: Constants.flagIconSize,
                       maxHeight: Constants.flagIconSize)
            VStack {
                Text(account.amount.currency)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .font(.system(size: FontSize.textMedium,
                                  weight: .medium))
                Text(account.amount.currencyName)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .font(.system(size: FontSize.textSmall))
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(account.amount.amount.currencyFormat)
                .font(.system(size: FontSize.amount,
                              weight: .medium))
        }
        .padding(Constants.rowPadding)
        .background(Color("itemBackgound"))
        .cornerRadius(CornerRadius.small)
        .shadow(radius: colorScheme == .dark ? .zero : ShadowSize.big)
    }
}

struct AccountRowView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRowView(account: Account(accountId: "3230bd7e-cb4c-553c-bcd3-607f3a3f8e20",
                                    companyName: "Business Example LTD",
                                    amount: Amount(amount: "198395.3700",
                                                   currency: "USD", currencyName: "US Dollars"),
                                    creditDebitIndicator: "Credit",
                                    datetime: "2022-08-08T15:44:45.294"))
    }
}
