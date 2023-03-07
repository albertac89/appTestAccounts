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
            VStack {
                Image("user")
                    .resizable()
                    .frame(maxWidth: IconSize.user, maxHeight: IconSize.user, alignment: .leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, Padding.leading)
                    .padding(.top, Padding.userTop)
                    .padding(.bottom, Padding.userBottom)
                Image("cloud")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, Padding.imageCloudHomeBottom)
                Text("Welcome")
                    .font(.system(size: FontSize.title, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, Padding.leading)
                    .padding(.bottom, Padding.textSpacing)
                Text("Company name")
                    .font(.system(size: FontSize.textMedium, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, Padding.leading)
                    .padding(.bottom, Padding.homeBannerBottom)
            }
        }.background(
            Image("fill").padding(.top, Padding.backgoundFillHomeTop)
        )
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HomeBanner()
    }
}
