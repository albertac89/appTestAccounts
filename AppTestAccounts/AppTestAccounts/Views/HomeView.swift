//
//  Home.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    struct Constants {
        static let currenciesTopViewAllMargin: CGFloat = 60
        static let currenciesTopOffset: CGFloat = -35
    }
    var body: some View {
        VStack {
            if !viewModel.viewAll {
                HomeBannerView(homeViewModel: viewModel)
                    .transition(.move(edge: .top))
            }
            CurrenciesView(homeViewModel: viewModel)
                .padding(.top, viewModel.viewAll ? Constants.currenciesTopViewAllMargin : Constants.currenciesTopOffset)
        }.alert("Error", isPresented: $viewModel.showError, actions: {
            Button("Ok", role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModelBuilder.shared.build())
    }
}
