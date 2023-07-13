//
//  AnimatePlaceholderModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import SwiftUI

struct AnimatePlaceholderModifier: AnimatableModifier {

    @Binding var isLoading: Bool

    @State private var isAnimation = false

    private var center = (UIScreen.main.bounds.width / 2) + 110

    private let animation: Animation = .linear(duration: 2)

    init(isLoading: Binding<Bool>) {
        self._isLoading = isLoading
    }

    func body(content: Content) -> some View {
        content.overlay(animView.mask(content))
    }

    var animView: some View {

        ZStack {

            SwiftUI.Color.black.opacity(isLoading ? 0.09 : 0.0)

            SwiftUI.Color.white.mask(

                Rectangle()
                    .fill(LinearGradient(gradient: .init(colors: [.white.opacity(0.48), .white]),
                                         startPoint: .leading,
                                         endPoint: .trailing))
                    .scaleEffect(3)
                    .rotationEffect(.init(degrees: 90.0))
                    .offset(x: isAnimation ? center : -center)
            )
        }
        .animation(isLoading ? animation.repeatForever(autoreverses: false) : nil, value: isAnimation)
        .onAppear {
            guard isLoading else {
                return
            }
            isAnimation.toggle()
        }
        .onChange(of: isLoading) { _ in
            isAnimation.toggle()
        }
    }
}
