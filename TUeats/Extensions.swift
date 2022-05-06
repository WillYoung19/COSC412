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
    static let darkGray22 = Color(red: 0.25, green: 0.25, blue: 0.25)

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

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {

    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}

