//
//  BottomNavigationView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

enum NavState {
    case home
    case products
}

struct BottomNavigationView: View {
    @Binding var navState: NavState
    @Environment(\.colorScheme) var colorScheme
    struct Constants {
        static let iconSize: CGFloat = 28
        static let navigationTop: CGFloat = 21
    }

    var body: some View {
        HStack {
            Button {
                withAnimation {
                    navState = .home
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
            }.foregroundColor(Color(navState == .home ? "selectedIconColor" : "iconColor"))
            Button {
                withAnimation {
                    navState = .products
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
            }.foregroundColor(Color(navState == .products ? "selectedIconColor" : "iconColor"))
        }
        .padding(.top, Constants.navigationTop)
        .background(Color("ItemBackgound")).edgesIgnoringSafeArea(.bottom)
        .borderRadius(CornerRadius.medium,
                      corners: [.topLeft, .topRight])
        .shadow(radius: colorScheme == .dark ? .zero : ShadowSize.small,
                y: colorScheme == .dark ? .zero : ShadowSize.offsetBig)
    }
}

struct BottomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationView(navState: .constant(.home))
    }
}
