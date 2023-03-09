//
//  SideMenuView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import SwiftUI

struct SideMenuView: View {
    @ObservedObject var homeViewModel: HomeViewModel

    struct Constants {
        static let sideBarWidth = UIScreen.main.bounds.size.width * 0.6
        static let screenWidth = UIScreen.main.bounds.size.width
        static let visibleMenuXPosition = screenWidth - sideBarWidth
        static let opacity = 0.6
        static let delay = 0.2
    }

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(Constants.opacity))
            .opacity(homeViewModel.isMenuVisible ? 1 : .zero)
            .animation(.easeInOut.delay(Constants.delay),
                       value: homeViewModel.isMenuVisible)
            .onTapGesture {
                homeViewModel.isMenuVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }

    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                Color("backgound")
                MenuView()
            }
            .frame(width: Constants.sideBarWidth)
            .offset(x: homeViewModel.isMenuVisible ? Constants.visibleMenuXPosition : Constants.screenWidth)
            .animation(.default,
                       value: homeViewModel.isMenuVisible)
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(homeViewModel: HomeViewModelBuilder.shared.build())
    }
}

