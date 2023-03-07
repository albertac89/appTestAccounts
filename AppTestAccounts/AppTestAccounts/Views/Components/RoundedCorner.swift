//
//  RoundedCorner.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    public func borderRadius<S>(_ content: S = Color.white, width: CGFloat = .zero, cornerRadius: CGFloat, corners: UIRectCorner) -> some View where S : ShapeStyle {
        let roundedRect = RoundedCorner(radius: cornerRadius, corners: [.topLeft, .topRight])
        return clipShape(roundedRect)
            .overlay(roundedRect.stroke(content, lineWidth: width))
    }
}
