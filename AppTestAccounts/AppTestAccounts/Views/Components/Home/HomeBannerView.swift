//
//  HomeBannerView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct HomeBannerView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    struct Constants {
        static let userIconSize: CGFloat = 32
        static let userTopPadding: CGFloat = 60
        static let userBottomPadding: CGFloat = 23
        static let imageCloudHomeBottomPadding: CGFloat = 40
        static let homeBannerBottomPadding: CGFloat = 92.5
        static let textSpacing: CGFloat = 1
        static let backgoundFillHomeTopPadding: CGFloat = 230
    }

    var body: some View {
        VStack {
            VStack {
                Button {
                    withAnimation {
                        homeViewModel.isMenuVisible.toggle()
                    }
                } label: {
                    Image("user")
                        .resizable()
                        .frame(maxWidth: Constants.userIconSize,
                               maxHeight: Constants.userIconSize,
                               alignment: .leading)
                }
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.leading, Padding.leading)
                .padding(.bottom, Constants.userBottomPadding)
                Image("cloud")
                    .frame(maxWidth: .infinity,
                           alignment: .trailing)
                    .padding(.bottom, Constants.imageCloudHomeBottomPadding)
                Text("Welcome")
                    .font(.system(size: FontSize.title,
                                  weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading, Padding.leading)
                    .padding(.bottom, Constants.textSpacing)
                Text("Company name")
                    .font(.system(size: FontSize.textMedium,
                                  weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading, Padding.leading)
            }
        }
        .padding(.top, Constants.userTopPadding)
        .padding(.bottom, Constants.homeBannerBottomPadding)
        .background(
            Image("fill")
                .padding(.top, Constants.backgoundFillHomeTopPadding)
        )
    }
}

struct HomeBannerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBannerView(homeViewModel: HomeViewModelBuilder.shared.build())
    }
}
