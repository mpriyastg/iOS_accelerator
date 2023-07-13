//
//  SampleModifier.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

//
//  ContentView.swift
//  MethodUtili
//
//  Created by admin on 21/06/23.
//

import SwiftUI

struct SampleModifier: View {
    @State private var isLoading = true
    @State private var showError = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("fadeInTextAnimation Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Fade In Animation")
                        .font(.title)
                        .foregroundColor(Color.blue)
                        .fadeInTextAnimation() // Applying the fadeInTextAnimation
                    Text("scaleTextAnimation Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Scale Animation")
                        .font(.title)
                        .foregroundColor(Color.red)
                        .scaleTextAnimation()  // Applying the scaleTextAnimation
                    Text("rotateTextAnimation Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Rotate Animation")
                        .font(.title)
                        .foregroundColor(Color.green)
                        .rotateTextAnimation()  // Applying the rotateTextAnimation
                    Text("blinkTextAnimation Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Blink Animation")
                        .font(.title)
                        .foregroundColor(Color.purple)
                        .blinkTextAnimation()  // Applying the blinkTextAnimation
                }
                VStack(alignment: .leading, spacing: 16) {
                    Text("typewriterTextAnimation Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Typewriter Animation")
                        .font(.title)
                        .foregroundColor(Color.orange)
                        .typewriterTextAnimation() // Applying the typewriterTextAnimation
                    Text("slideUpTextAnimation Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Slide Up Animation")
                        .font(.title)
                        .foregroundColor(Color.blue)
                        .slideUpTextAnimation() // Applying the slideUpTextAnimation
                }
//                VStack(alignment: .leading, spacing: 16) {
//                    Text("textAnimation Modifier")
//                        .font(Font.system(size: 20))
//                        .fontWeight(.bold)
//                    Text("Animate Me!")
//                        .font(.largeTitle)
//                        .foregroundColor(Color.blue)
//                        .textAnimation() // Applying the textAnimation
//                }
                VStack(alignment: .leading, spacing: 16) {
                    Text("MakeCard Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Hello, World!")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .makeCard() // Applying the CardModifier
                    Text("AnimationPlaceholder Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("Content")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .modifier(AnimatePlaceholderModifier(isLoading: $isLoading))
                        .onTapGesture {
                            isLoading.toggle()
                        }
                }
                VStack(alignment: .leading, spacing: 16) {
                    Text("errorStyle Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("This is an error message")
                        .errorStyle() // Applying the ErrorStyle

                        .opacity(showError ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 0.3), value: 2)

                    Button("Toggle Error") {
                        showError.toggle()
                    }
                    .padding()
                }
                VStack(alignment: .leading, spacing: 16) {
                    Text("descriptionStyle Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Text("This is a description of an item that spans multiple lines. " +
                         "It provides additional information about the item.")
                        .descriptionStyle() // Applying the descriptionStyle
                }
                VStack(alignment: .leading, spacing: 16) {
                    Text("circular Modifier")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .circular()   // Applying the circular
                }

            }
            .padding()
        }
        .padding()
    }
}

struct SampleModifier_Previews: PreviewProvider {
    static var previews: some View {
        SampleModifier()
    }
}
