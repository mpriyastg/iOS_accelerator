//
//  DescriptionModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import Foundation
import SwiftUI

struct DescriptionStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .foregroundColor(DesignConstants.textColor)
            .font(DesignConstants.textFont)
            .lineSpacing(5)
            .lineLimit(nil)
    }

    struct DesignConstants {
        static let textColor = Color.gray
        static let textFont: Font = Font.body
    }
}

extension View {
    func descriptionStyle() -> some View {
        modifier(DescriptionStyle())
    }
}
