//
//  MenuView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import SwiftUI

struct MenuView: View {
    struct Constants {
        static let topPaddingWithoutSafeArea: CGFloat = 60
        static let bottomPaddingWithoutSafeArea: CGFloat = 35
    }

    var body: some View {
        VStack {
            Text("Company name")
                .font(.system(size: FontSize.textBig,
                              weight: .medium))
            ButtonMenuView(text: "Account",
                           sfSymbol: "person.crop.circle")
            ButtonMenuView(text: "Settings",
                           sfSymbol: "gearshape.fill")
            ButtonMenuView(text: "Contact",
                           sfSymbol: "phone.bubble.left")
            Spacer()
            ButtonMenuView(text: "Log out",
                           sfSymbol: "rectangle.portrait.and.arrow.forward")
        }
        .padding(.top, Constants.topPaddingWithoutSafeArea)
        .padding(.bottom, Constants.bottomPaddingWithoutSafeArea)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
