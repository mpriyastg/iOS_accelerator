//
//  ViewModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import SwiftUI

struct CircularModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(1, contentMode: .fit)
            .clipShape(Circle())
    }
}

extension View {
    func circular() -> some View {
        modifier(CircularModifier())
    }
}

struct CardShapeModifier: ViewModifier {
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black.opacity(0.25), radius: 3, x: 0, y: 1)
            )
    }
}

extension View {
    func cardShape(cornerRadius: CGFloat = 10) -> some View {
        modifier(CardShapeModifier(cornerRadius: cornerRadius))
    }
}

struct TextAnimationModifier: ViewModifier {
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .offset(x: isAnimating ? 0 : -1000)
            .animation(.easeInOut(duration: 1.0), value: 2)
            .onAppear {
                withAnimation {
                    isAnimating = true
                }
            }
    }
}

extension View {
    func textAnimation() -> some View {
        modifier(TextAnimationModifier())
    }
}

struct FadeInTextModifier: ViewModifier {
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .opacity(isAnimating ? 1.0 : 0.0)
            .animation(.easeIn(duration:2.0))
            .onAppear {
                withAnimation {
                    isAnimating = true
                }
            }
    }
}

extension View {
    func fadeInTextAnimation() -> some View {
        modifier(FadeInTextModifier())
    }
}
struct SlideUpTextModifier: ViewModifier {
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .offset(y: isAnimating ? 0 : UIScreen.main.bounds.height)
            .animation(.easeInOut(duration: 3.0))
            .onAppear {
                withAnimation {
                    isAnimating = true
                }
            }
    }
}

extension View {
    func slideUpTextAnimation() -> some View {
        modifier(SlideUpTextModifier())
    }
}
struct ScaleTextModifier: ViewModifier {
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(isAnimating ? 1.0 : 0.5)
            .animation(.spring(response: 2.0, dampingFraction: 0.6))
            .onAppear {
                withAnimation {
                    isAnimating = true
                }
            }
    }
}

extension View {
    func scaleTextAnimation() -> some View {
        modifier(ScaleTextModifier())
    }
}
struct RotateTextModifier: ViewModifier {
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(.linear(duration: 1.5).repeatForever(autoreverses: false))
            .onAppear {
                withAnimation {
                    isAnimating = true
                }
            }
    }
}

extension View {
    func rotateTextAnimation() -> some View {
        modifier(RotateTextModifier())
    }
}
struct BlinkTextModifier: ViewModifier {
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .opacity(isAnimating ? 1.0 : 0.0)
            .animation(Animation.easeInOut(duration: 0.5).repeatForever())
            .onAppear {
                withAnimation {
                    isAnimating = true
                }
            }
    }
}

extension View {
    func blinkTextAnimation() -> some View {
        modifier(BlinkTextModifier())
    }
}
struct TypewriterTextModifier: ViewModifier {
    @State private var isVisible = false

    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 3.0))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isVisible = true
                    }
                }
            }
    }
}

extension View {
    func typewriterTextAnimation() -> some View {
        modifier(TypewriterTextModifier())
    }
}
