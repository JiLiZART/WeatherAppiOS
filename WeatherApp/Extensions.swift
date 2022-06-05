//
//  Extensions.swift
//  WeatherApp
//
//  Created by Nikolay Kostyurin on 05.06.2022.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

extension Color {
    public static var deepBlue: Color {
        return Color(hue: 0.649, saturation: 0.669, brightness: 1.0)
    }
}

extension String {
    func degree() -> String {
        return self + "°"
    }
}
