//
//  MainView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        ZStack {
            VStack {
                switch viewModel.navState {
                case .home:
                    HomeView(mainViewModel: viewModel)
                        .transition(.asymmetric(insertion: .move(edge: .leading),
                                                removal: .move(edge: .trailing)))
                case .products:
                    ProductsView()
                        .transition(.asymmetric(insertion: .move(edge: .leading),
                                                removal: .move(edge: .trailing)))
                }
                BottomNavigationView(mainViewModel: viewModel)
                    .background(Color("itemBackgound"))
                    .edgesIgnoringSafeArea(.bottom)
            }.background(
                Image("backgoundImage").resizable()
            ).edgesIgnoringSafeArea(.top)
            SideMenuView(mainViewModel: viewModel)
        }
    }
}

enum MainNav {
    case home
    case products
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(accountService: AccountService(client: URLSession.shared)))
    }
}
