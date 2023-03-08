//
//  SideMenuView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import SwiftUI

struct SideMenuView: View {
    @ObservedObject var mainViewModel: MainViewModel

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
            .opacity(mainViewModel.isMenuVisible ? 1 : .zero)
            .animation(.easeInOut.delay(Constants.delay),
                       value: mainViewModel.isMenuVisible)
            .onTapGesture {
                mainViewModel.isMenuVisible.toggle()
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
            .offset(x: mainViewModel.isMenuVisible ? Constants.visibleMenuXPosition : Constants.screenWidth)
            .animation(.default,
                       value: mainViewModel.isMenuVisible)
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(mainViewModel: MainViewModel(accountService: AccountService(client: URLSession.shared)))
    }
}

