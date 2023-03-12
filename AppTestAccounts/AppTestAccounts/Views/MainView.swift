//
//  MainView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct MainView: View {
    @State var navState: NavState
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {
        ZStack {
            VStack {
                switch navState {
                case .home:
                    HomeView(viewModel: homeViewModel)
                        .transition(.asymmetric(insertion: .move(edge: .leading),
                                                removal: .move(edge: .trailing)))
                case .products:
                    ProductsView()
                        .transition(.asymmetric(insertion: .move(edge: .leading),
                                                removal: .move(edge: .trailing)))
                }
                BottomNavigationView(navState: $navState)
                    .background(Color("ItemBackgound"))
                    .edgesIgnoringSafeArea(.bottom)
            }.background(
                Image("backgoundImage").resizable()
            ).edgesIgnoringSafeArea(.top)
            SideMenuView(homeViewModel: homeViewModel)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(navState: .home, homeViewModel: HomeViewModelBuilder.shared.build())
    }
}
