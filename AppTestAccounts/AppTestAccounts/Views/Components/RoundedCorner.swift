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
    
    /// Return a path to render in a `View`.
    ///
    /// - Parameters:
    ///     - rect: The rectangle to render the path
    ///
    /// - Returns: A `Path` to be rended.
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    /// Adds border radius to a specified corner or corners of a `View`.
    ///
    /// - Parameters:
    ///     - content: Color of the stroke.
    ///     - width: Width of the line of the stroke.
    ///     - cornerRadius: Radius of the corner or corners.
    ///     - corners: Array of the  `UIRectCorner` to modify.
    public func borderRadius(_ cornerRadius: CGFloat, corners: UIRectCorner) -> some View {
        let roundedRect = RoundedCorner(radius: cornerRadius,
                                        corners: [.topLeft, .topRight])
        return clipShape(roundedRect)
    }
}
