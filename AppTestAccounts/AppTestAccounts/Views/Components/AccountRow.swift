//
//  AccountRow.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct AccountRow: View {
    let account: Account
    var body: some View {
        HStack {
            HStack {
                
            }
            Image(uiImage: .add)
                .resizable()
                .frame(maxWidth: 32, maxHeight: 32)
            VStack {
                Text(account.amount.currency)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 17))
                Text(account.amount.currencyName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(account.amount.amount)
        }
        .padding(16)
        .background(.white)
        .cornerRadius(8)
        .shadow(color: Color.gray, radius: 6)
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow(account: Account(accountId: "3230bd7e-cb4c-553c-bcd3-607f3a3f8e20",
                                    companyName: "Business Example LTD",
                                    amount: Amount(amount: "198395.3700",
                                                   currency: "USD", currencyName: "US Dollars"),
                                    creditDebitIndicator: "Credit",
                                    datetime: "2022-08-08T15:44:45.294"))
    }
}
