//
//  SubHeaderStyleModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import Foundation
import SwiftUI

struct SubHeaderModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .foregroundColor(DesignConstants.textColor)
            .font(DesignConstants.textFont)
            .frame(height: DesignConstants.height)
    }

    struct DesignConstants {
        static let textColor = Color.gray
        static let textFont: Font = Font.subheadline
        static let height: CGFloat = 16
    }
}

extension View {
    func subheaderStyle() -> some View {
        modifier(SubHeaderModifier())
    }
}
