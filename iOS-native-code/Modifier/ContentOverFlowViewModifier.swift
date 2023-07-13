//
//  ContentOverFlowViewModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import Foundation
import SwiftUI
struct ContentOverFlowViewModifier: ViewModifier {
    @State private var contentOverflow: Bool = false
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .background(
                    GeometryReader { contentGeometry in
                        SwiftUI.Color.clear
                            .onAppear {
                                contentOverflow = contentGeometry.size.height > geometry.size.height
                            }
                            .onChange(of: contentGeometry.size.height) { _ in
                                contentOverflow = contentGeometry.size.height > geometry.size.height
                            }
                    }
                )
                .wrappedInScrollView(when: contentOverflow)
        }
    }
}
extension View {
    @ViewBuilder
    func wrappedInScrollView(when condition: Bool) -> some View {
        if condition {
            ScrollView(.vertical, showsIndicators: false) {
                self
            }
        } else {
            self
        }
    }
}

extension View {
    func scrollOnOverflow() -> some View {
        modifier(ContentOverFlowViewModifier())
    }
}
