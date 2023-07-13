//
//  CardModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding()
            .background(DesignConstants.cardBgColor)
            .cornerRadius(DesignConstants.cornerRadius)
            .shadow(color: SwiftUI.Color(.black).opacity(0.25), radius: DesignConstants.shadowRadius, x: 0, y: 1)
    }

    struct DesignConstants {
        static let cardBgColor = Color.white
      static let cornerRadius: CGFloat = 10
      static let shadowRadius: CGFloat = 3
    }
}

extension View {
    func makeCard() -> some View {
        modifier(CardModifier())
    }
}
