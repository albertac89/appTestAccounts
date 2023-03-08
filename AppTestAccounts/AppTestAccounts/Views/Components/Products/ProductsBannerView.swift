//
//  ProductsBannerView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct ProductsBannerView: View {
    struct Constants {
        static let imageCloudProductsTop: CGFloat = 73
        static let productBannerTextBottom: CGFloat = 31
        static let backgoundFillProductsTop: CGFloat = 190
    }

    var body: some View {
        VStack {
            Image("cloud2")
                .frame(maxWidth: .infinity,
                       alignment: .trailing)
                .padding(.top, Constants.imageCloudProductsTop)
            Text("Products")
                .font(.system(size: FontSize.title,
                              weight: .medium))
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .foregroundColor(.white)
                .padding(.leading, Padding.leading)
                .padding(.bottom, Constants.productBannerTextBottom)
        }.background(
            Image("fill")
                .padding(.top, Constants.backgoundFillProductsTop)
        )
    }
}

struct ProductsBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsBannerView()
    }
}
