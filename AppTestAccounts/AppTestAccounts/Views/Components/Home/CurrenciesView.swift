//
//  CurrenciesView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct CurrenciesView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    struct Constants {
        static let currenciesTextLeading: CGFloat = 24
        static let currenciesTextTrailing: CGFloat = 24
        static let currenciesTextTop: CGFloat = 40
        static let currenciesTextBottom: CGFloat = 16
    }

    var body: some View {
        VStack {
            HStack {
                Text("Your currencies")
                    .font(.system(size: FontSize.textMedium,
                                  weight: .medium))
                Spacer()
                if homeViewModel.accounts.count > 0 && !homeViewModel.isLoading {
                    Text(homeViewModel.viewAllText)
                        .font(.system(size: FontSize.textMedium,
                                      weight: .medium))
                        .foregroundColor(Color("actionText"))
                        .animation(.easeInOut)
                        .onTapGesture {
                            withAnimation {
                                homeViewModel.viewAll.toggle()
                                homeViewModel.showAllAcountsIfNeeded()
                            }
                        }
                }
            }
            .padding(.leading, Constants.currenciesTextLeading)
            .padding(.trailing, Constants.currenciesTextTrailing)
            .padding(.top, Constants.currenciesTextTop)
            .padding(.bottom, Constants.currenciesTextBottom)
            if homeViewModel.isLoading {
                LoaderView(scale: 1)
            } else {
                List(homeViewModel.accounts, id: \.accountId.self) { account in
                    AccountRowView(account: account)
                        .listRowSeparator(.hidden)
                }.refreshable {
                    homeViewModel.getAccounts()
                }
                .listStyle(PlainListStyle())
            }
            Spacer()
        }
        .onAppear(perform: homeViewModel.getAccounts)
        .background(Color("backgound"))
        .borderRadius(cornerRadius: CornerRadius.big,
                      corners: [.topLeft, .topRight])
        
    }
}

struct CurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView(homeViewModel: HomeViewModelBuilder.shared.build())
    }
}
