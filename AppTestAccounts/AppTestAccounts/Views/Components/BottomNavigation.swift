//
//  BottomNavigation.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct BottomNavigation: View {
    var body: some View {
        HStack {
            VStack {
                Image(uiImage: .add)
                    .resizable()
                    .frame(maxWidth: 28, maxHeight: 28, alignment: .center)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Home")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            VStack {
                Image(uiImage: .remove)
                    .resizable()
                    .frame(maxWidth: 28, maxHeight: 28, alignment: .center)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Products")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.top, 21)
        .background(.white)
        .borderRadius(Color.red, width: 0, cornerRadius: 10, corners: [.topLeft, .topRight])
        .shadow(color: Color.gray, radius: 3, y: -6)
    }
}

struct BottomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigation()
    }
}
