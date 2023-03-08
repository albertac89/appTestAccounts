//
//  BottomNavigationView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct BottomNavigationView: View {
    @ObservedObject var mainViewModel: MainViewModel
    @Environment(\.colorScheme) var colorScheme
    struct Constants {
        static let iconSize: CGFloat = 28
        static let navigationTop: CGFloat = 21
    }

    var body: some View {
        HStack {
            Button {
                withAnimation {
                    mainViewModel.navState = .home
                }
            } label: {
                VStack {
                    Image("homeIcon")
                        .resizable()
                        .frame(maxWidth: Constants.iconSize,
                               maxHeight: Constants.iconSize,
                               alignment: .center)
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                    Text("Home")
                        .font(.system(size: FontSize.textMicro))
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                }
            }.foregroundColor(Color(mainViewModel.navState == .home ? "selectedIconColor" : "iconColor"))
            Button {
                withAnimation {
                    mainViewModel.navState = .products
                }
            } label: {
                VStack {
                    Image("productsIcon")
                        .resizable()
                        .frame(maxWidth: Constants.iconSize,
                               maxHeight: Constants.iconSize,
                               alignment: .center)
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                    Text("Products")
                        .font(.system(size: FontSize.textMicro))
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                }
            }.foregroundColor(Color(mainViewModel.navState == .products ? "selectedIconColor" : "iconColor"))
        }
        .padding(.top, Constants.navigationTop)
        .background(Color("itemBackgound")).edgesIgnoringSafeArea(.bottom)
        .borderRadius(cornerRadius: CornerRadius.medium,
                      corners: [.topLeft, .topRight])
        .shadow(radius: colorScheme == .dark ? .zero : ShadowSize.small,
                y: colorScheme == .dark ? .zero : ShadowSize.offsetBig)
    }
}

struct BottomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationView(mainViewModel: MainViewModel(accountService: AccountService(client: URLSession.shared)))
    }
}
