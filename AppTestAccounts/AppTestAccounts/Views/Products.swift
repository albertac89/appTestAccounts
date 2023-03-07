//
//  Products.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import SwiftUI

struct Products: View {
    var body: some View {
        VStack {
            ProductsBanner()
            ProductsEmptyState()
        }
    }
}

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        Products()
    }
}
