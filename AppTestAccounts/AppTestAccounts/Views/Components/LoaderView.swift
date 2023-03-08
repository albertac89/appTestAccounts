//
//  LoaderView.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 8/3/23.
//

import SwiftUI

struct LoaderView: View {
    let scale: CGFloat

    var body: some View {
        ProgressView()
            .scaleEffect(scale, anchor: .top)
            .progressViewStyle(CircularProgressViewStyle(tint: Color("actionText")))
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(scale: 4)
    }
}
