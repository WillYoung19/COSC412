//
//  Extensions.swift
//  TUeats
//
//  Created by Brandon Grabowski on 4/23/22.
//

import Foundation
import SwiftUI

extension Color {
    //https://developer.apple.com/documentation/uikit/uicolor/standard_colors

    static let darkGray = Color(red: 0.1, green: 0.1, blue: 0.1)
    static let darkGray2 = Color(red: 0.2, green: 0.2, blue: 0.2)
    static let darkGray3 = Color(red: 0.3, green: 0.3, blue: 0.3)
    static let darkGray4 = Color(red: 0.4, green: 0.4, blue: 0.4)
    
    static let darkBlue = Color(red: 0.0, green: 0.09, blue: 0.815)

    static let lightBlue1 = Color(red: 0.160, green: 0.376, blue: 1.0)
    static let lightBlue2 = Color(red: 0.039, green: 0.580, blue: 1.0)
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
