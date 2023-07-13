//
//  ButtonSample.swift
//  InterviewSwiftUI
//
//  Created by admin on 30/05/23.
//

import SwiftUI

struct ButtonSample: View {
    var body: some View {
        ScrollView {
            Group {
                VStack(spacing: 20) {
                    VStack(spacing: 10) {
                        Text("Primary Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.primaryButton(with: ButtonProperties(
                            title: "Primary Button",
                            foregroundColor: .white,
                            backgroundColor: .blue,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Primary button action
                            }
                        ))
                        Divider()
                        Text("Secondary Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.secondaryButton(with: ButtonProperties(
                            title: "Secondary Button",
                            foregroundColor: .blue,
                            backgroundColor: .white,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Secondary button action
                            }
                        ))
                    }
                    Divider()
                    VStack(spacing: 10) {
                        Text("Rounded Border Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.roundedBorderButton(with: ButtonProperties(
                            title: "Rounded Border Button",
                            foregroundColor: .blue,
                            backgroundColor: .white,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Rounded border button action
                            }
                        ), borderColor: .blue, borderWidth: 2)
                        Divider()
                        Text("Destructive Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.destructiveButton(with: ButtonProperties(
                            title: "Destructive Button",
                            foregroundColor: .white,
                            backgroundColor: .red,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Destructive button action
                            }
                        ))
                        Divider()
                        Text("Disabled Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.disabledButton(with: ButtonProperties(
                            title: "Disabled Button",
                            foregroundColor: .gray,
                            backgroundColor: .white,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Disabled button action
                            }
                        ))
                    }
                    Divider()
                    VStack(spacing: 10) {
                        Text("Image Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.imageButton(with: ButtonProperties(
                            title: "Image Button",
                            foregroundColor: .white,
                            backgroundColor: .blue,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Image button action
                            }
                        ), imageName: "heart.fill")
                        Divider()
                        Text("Icon Text Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.iconTextButton(with: ButtonProperties(
                            title: "Icon Text Button",
                            foregroundColor: .blue,
                            backgroundColor: .white,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Icon text button action
                            }
                        ), icon: "star.fill")
                        Divider()
                        Text("Rounded Icon Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.roundedIconButton(with: ButtonProperties(
                            title: "",
                            foregroundColor: .white,
                            backgroundColor: .blue,
                            cornerRadius: 25,
                            fontSize: 0,
                            action: {
                                // Rounded icon button action
                            }
                        ), icon: "plus")
                    }
                    Divider()
                    VStack(spacing: 10) {
                        Text("Shadow Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.shadowButton(with: ButtonProperties(
                            title: "Shadow Button",
                            foregroundColor: .white,
                            backgroundColor: .blue,
                            cornerRadius: 10,
                            fontSize: 15,
                            action: {
                                // Shadow button action
                            }
                        ))
                        Divider()
                        Text("Rounded Capsule Button:")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        ButtonUtility.roundedCapsuleButton(with: ButtonProperties(
                            title: "Rounded Capsule Button",
                            foregroundColor: .white,
                            backgroundColor: .blue,
                            cornerRadius: 30,
                            fontSize: 15,
                            action: {
                                // Rounded capsule button action
                            }
                        ))
                        Divider()
                        VStack(spacing: 10) {
                            Text("Rounded Rect Button:")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            ButtonUtility.roundedRectButton(with: ButtonProperties(
                                title: "Rounded Rect Button",
                                foregroundColor: .blue,
                                backgroundColor: .white,
                                cornerRadius: 10,
                                fontSize: 15,
                                action: {
                                    // Rounded rect button action
                                }
                            ))
                            Divider()
                            Text("Pill Button:")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            ButtonUtility.pillButton(with: ButtonProperties(
                                title: "Pill Button",
                                foregroundColor: .blue,
                                backgroundColor: .white,
                                cornerRadius: 20,
                                fontSize: 15,
                                action: {
                                    // Pill button action
                                }
                            ))
                            Divider()
                            Text("Plain Button:")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            ButtonUtility.plainButton(with: ButtonProperties(
                                title: "Plain Button",
                                foregroundColor: .blue,
                                backgroundColor: .white,
                                cornerRadius: 0,
                                fontSize: 15,
                                action: {
                                    // Plain button action
                                }
                            ))
                            Divider()
                            VStack(spacing: 10) {
                                Text("Link Button:")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                ButtonUtility.linkButton(with: ButtonProperties(
                                    title: "Link Button",
                                    foregroundColor: .blue,
                                    backgroundColor: .white,
                                    cornerRadius: 0,
                                    fontSize: 15,
                                    action: {
                                        // Link button action
                                    }
                                ))
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct DestructiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
    }
}

struct LinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.blue)
            .font(.system(size: 15))
    }
}

struct ButtonSample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSample()
    }
}
