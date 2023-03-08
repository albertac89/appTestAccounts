//
//  ProductsView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        VStack {
            ProductsBannerView()
            ProductsEmptyStateView()
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
