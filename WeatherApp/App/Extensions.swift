//
//  Extensions.swift
//  WeatherApp
//
//  Created by Ashraf Hatia on 30/05/24.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRedius(_ redius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: 20, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
