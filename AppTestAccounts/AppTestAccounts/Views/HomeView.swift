//
//  Home.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var mainViewModel: MainViewModel
    struct Constants {
        static let currenciesTopViewAllMargin: CGFloat = 60
        static let currenciesTopOffset: CGFloat = -35
    }
    var body: some View {
        VStack {
            if !mainViewModel.viewAll {
                HomeBannerView(mainViewModel: mainViewModel)
                    .transition(.move(edge: .top))
            }
            CurrenciesView(mainViewModel: mainViewModel)
                .padding(.top, mainViewModel.viewAll ? Constants.currenciesTopViewAllMargin : Constants.currenciesTopOffset)
        }.alert("Error", isPresented: $mainViewModel.showError, actions: {
            Button("Ok", role: .cancel) { }
        }, message: {
            Text(mainViewModel.errorMessage)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(mainViewModel: MainViewModel(accountService: AccountService(client: URLSession.shared)))
    }
}
