//
//  ErrorModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import Foundation
import SwiftUI

struct ErrorViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(DesignConstants.textColor)
            .font(DesignConstants.textFont)
            .frame(height: 16)
    }

    struct DesignConstants {
        static let textColor = Color.red
        static let textFont: Font = Font.title
    }
}

extension View {
    func errorStyle() -> some View {
        modifier(ErrorViewModifier())
    }
}
