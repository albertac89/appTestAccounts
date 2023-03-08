//
//  ButtonMenuView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import SwiftUI

struct ButtonMenuView: View {
    let text: String
    let sfSymbol: String
    struct Constants {
        static let iconSize: CGFloat = 25
        static let iconAndTextPadding: CGFloat = 10
        static let buttonPadingBottom: CGFloat = 8
    }
    var body: some View {
        Button {
        } label: {
            HStack {
                Image(systemName: sfSymbol)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color("actionText"))
                    .frame(maxWidth: Constants.iconSize,
                           maxHeight: Constants.iconSize)
                Text(text)
                    .font(.system(size: FontSize.textMedium,
                                  weight: .medium))
                    .foregroundColor(Color("actionText"))
            }
            .padding(Constants.iconAndTextPadding)
            .frame(maxWidth: .infinity,
                   alignment: .center)
        }
        .background(Color("itemBackgound"))
        .cornerRadius(CornerRadius.small)
        .padding(.leading, Padding.leading)
        .padding(.trailing, Padding.trailing)
        .shadow(radius: ShadowSize.small)
        .padding(.bottom, Constants.buttonPadingBottom)
    }
}

struct ButtonMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonMenuView(text: "Button menu", sfSymbol: "person.circle")
    }
}
