//
//  HeaderViewModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import Foundation
import SwiftUI

struct Header: ViewModifier {

    func body(content: Content) -> some View {
        content
            .foregroundColor(DesignConstants.titleColor)
            .font(DesignConstants.titleFont)
            .frame(height: DesignConstants.heigth)
    }

    struct DesignConstants {
        static let titleColor = Color.black
        static let titleFont: Font  = Font.title
        static let heigth: CGFloat = 28
    }
}

extension View {
    func headerStyle() -> some View {
        modifier(Header())
    }
}
