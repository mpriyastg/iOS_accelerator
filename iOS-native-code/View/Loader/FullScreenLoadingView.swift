//
//  FullScreenLoadingView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 23/06/23.
//

import SwiftUI

struct FullScreenLoadingView: View {

    @State private var isCircleRotating = true
    @State private var animateStart = false
    @State private var animateEnd = true
    var title: String = ""

    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 10) {
                Spacer()
                ZStack {
                    Circle()
                        .stroke(lineWidth: 10)
                        .fill(Color.init(red: 0.96, green: 0.96, blue: 0.96))
                        .frame(width: 80, height: 80)

                    Circle()
                        .trim(from: animateStart ? 1/3 : 1/9, to: animateEnd ? 2/5 : 1)
                        .stroke(lineWidth: 10)
                        .rotationEffect(.degrees(isCircleRotating ? 360 : 0))
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.blue)
                        .onAppear {
                            withAnimation(Animation
                                .linear(duration: 1)
                                .repeatForever(autoreverses: false)) {
                                    self.isCircleRotating.toggle()
                                }
                            withAnimation(Animation
                                .linear(duration: 1)
                                .delay(0.5)
                                .repeatForever(autoreverses: true)) {
                                    self.animateStart.toggle()
                                }
                            withAnimation(Animation
                                .linear(duration: 1)
                                .delay(1)
                                .repeatForever(autoreverses: true)) {
                                    self.animateEnd.toggle()
                                }
                        }
                }
                Text(title)
                    .font(.system(size: 16))
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct FullScreenLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenLoadingView()
    }
}
