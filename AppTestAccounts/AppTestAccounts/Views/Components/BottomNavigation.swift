//
//  BottomNavigation.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct BottomNavigation: View {
    @ObservedObject var mainViewModel: MainViewModel
    @Environment(\.colorScheme) var colorScheme
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
                        .frame(maxWidth: IconSize.nav, maxHeight: IconSize.nav, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("Home")
                        .font(.system(size: FontSize.textMicro))
                        .frame(maxWidth: .infinity, alignment: .center)
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
                        .frame(maxWidth: IconSize.nav, maxHeight: IconSize.nav, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("Products")
                        .font(.system(size: FontSize.textMicro))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }.foregroundColor(Color(mainViewModel.navState == .products ? "selectedIconColor" : "iconColor"))
        }
        .padding(.top, Padding.navigationTop)
        .background(Color("itemBackgound")).edgesIgnoringSafeArea(.bottom)
        .borderRadius(cornerRadius: CornerRadius.medium,
                      corners: [.topLeft, .topRight])
        .shadow(color: Color.gray,
                radius: colorScheme == .dark ? .zero : ShadowSize.small,
                y: colorScheme == .dark ? .zero : ShadowSize.offsetBig)
    }
}

struct BottomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigation(mainViewModel: MainViewModel())
    }
}
