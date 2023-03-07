//
//  ProductsEmptyState.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct ProductsEmptyState: View {
    var body: some View {
        VStack {
            Spacer()
            Image("emptyState")
                .resizable()
                .frame(maxWidth: ImageSize.emptyState.width,
                       maxHeight: ImageSize.emptyState.height,
                       alignment: .center)
            Text("Coming soon")
                .font(.system(size: FontSize.textBig))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, Padding.textSpacing)
            Text("We are currently working in more features to offer the best experience")
                .font(.system(size: FontSize.textMedium))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.leading, Padding.textSidesSpacingBig)
                .padding(.trailing, Padding.textSidesSpacingBig)
            Spacer()
        }
        .background(Color("backgound"))
        .borderRadius(cornerRadius: CornerRadius.big,
                      corners: [.topLeft, .topRight])
    }
}

struct ProductsEmptyState_Previews: PreviewProvider {
    static var previews: some View {
        ProductsEmptyState()
    }
}
