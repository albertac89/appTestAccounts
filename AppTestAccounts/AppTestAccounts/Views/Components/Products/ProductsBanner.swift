//
//  ProductsBanner.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct ProductsBanner: View {
    var body: some View {
        VStack {
            Image("cloud2")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, Padding.imageCloudProductsTop)
            Text("Products")
                .font(.system(size: FontSize.title, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .padding(.leading, Padding.productBannerTextLeading)
                .padding(.bottom, Padding.productBannerTextBottom)
        }.background(
            Image("fill").padding(.top, Padding.backgoundFillProductsTop)
        )
        //.background(.red)
    }
}

struct ProductsBanner_Previews: PreviewProvider {
    static var previews: some View {
        ProductsBanner()
    }
}
