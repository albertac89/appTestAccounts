//
//  Header.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct HomeBanner: View {
    var body: some View {
        VStack {
            Image(uiImage: .remove)
                .resizable()
                .frame(maxWidth: 32, maxHeight: 32, alignment: .leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.top, 60)
                .padding(.bottom, 82.5)
            Text("Welcome")
                .font(.system(size: 34))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.bottom, 8)
            Text("Company name")
                .font(.system(size: 17))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.bottom, 92.5+24)
        }.background(
            Image("HomeBannerBackgroundLight").resizable()
        ).edgesIgnoringSafeArea(.top)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HomeBanner()
    }
}
