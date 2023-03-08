//
//  ProductsEmptyStateView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct ProductsEmptyStateView: View {
    struct Constants {
        struct emptyState {
            static let width: CGFloat = 250
            static let height: CGFloat = 194
        }
        static let textSpacing: CGFloat = 1
    }
    var body: some View {
        VStack {
            Spacer()
            Image("emptyState")
                .resizable()
                .frame(maxWidth: Constants.emptyState.width,
                       maxHeight: Constants.emptyState.height,
                       alignment: .center)
            Text("Coming soon")
                .font(.system(size: FontSize.textBig))
                .frame(maxWidth: .infinity,
                       alignment: .center)
                .padding(.bottom, Constants.textSpacing)
            Text("We are currently working in more features to offer the best experience")
                .font(.system(size: FontSize.textMedium))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.leading, Padding.leadingBig)
                .padding(.trailing, Padding.trailingBig)
            Spacer()
        }
        .background(Color("backgound"))
        .borderRadius(cornerRadius: CornerRadius.big,
                      corners: [.topLeft, .topRight])
    }
}

struct ProductsEmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsEmptyStateView()
    }
}
