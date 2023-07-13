//
//  FontConstant.swift
//  iOS-native-code
//
//  Created by admin on 16/06/23.
//

import Foundation
import SwiftUI

struct CustomFontModifier: ViewModifier {
    var size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}
extension View {
    func customFontSize(_ size: CGFloat) -> some View {
        self.modifier(CustomFontModifier(size: size))
    }
}
