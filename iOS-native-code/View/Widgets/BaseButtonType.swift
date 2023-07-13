//
//  ButtonSam.swift
//  InterviewSwiftUI
//
//  Created by admin on 14/06/23.
//

import SwiftUI

struct ButtonProperties {
    let title: String
    let foregroundColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let fontSize: CGFloat
    let action: () -> Void
}

struct ButtonUtility {
    static func primaryButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(properties.backgroundColor)
                .cornerRadius(properties.cornerRadius)
        }
    }

    static func secondaryButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(properties.backgroundColor)
                .cornerRadius(properties.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: properties.cornerRadius)
                        .stroke(properties.foregroundColor, lineWidth: 2)
                )
        }
    }

    static func roundedBorderButton(with properties: ButtonProperties,
                                    borderColor: Color,
                                    borderWidth: CGFloat) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(properties.backgroundColor)
                .cornerRadius(properties.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: properties.cornerRadius)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
        }
    }

    static func destructiveButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(properties.backgroundColor)
                .cornerRadius(properties.cornerRadius)
        }
        .buttonStyle(DestructiveButtonStyle())
    }

    static func disabledButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(properties.backgroundColor)
                .cornerRadius(properties.cornerRadius)
        }
        .disabled(true)
    }

    static func imageButton(with properties: ButtonProperties, imageName: String) -> some View {
        Button(action: properties.action) {
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(properties.foregroundColor)
                Text(properties.title)
                    .foregroundColor(properties.foregroundColor)
                    .font(.system(size: properties.fontSize))
            }
            .padding()
            .background(properties.backgroundColor)
            .cornerRadius(properties.cornerRadius)
        }
    }

    static func iconTextButton(with properties: ButtonProperties, icon: String) -> some View {
        Button(action: properties.action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(properties.foregroundColor)
                Text(properties.title)
                    .foregroundColor(properties.foregroundColor)
                    .font(.system(size: properties.fontSize))
            }
            .padding()
            .background(properties.backgroundColor)
            .cornerRadius(properties.cornerRadius)
        }
    }

    static func roundedIconButton(with properties: ButtonProperties, icon: String) -> some View {
        Button(action: properties.action) {
            Image(systemName: icon)
                .foregroundColor(properties.foregroundColor)
                .padding()
                .background(properties.backgroundColor)
                .cornerRadius(properties.cornerRadius)
        }
    }

    static func shadowButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(properties.backgroundColor)
                .cornerRadius(properties.cornerRadius)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
        }
    }

    static func roundedCapsuleButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(properties.backgroundColor)
                .clipShape(Capsule())
        }
    }

    static func roundedRectButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: properties.cornerRadius)
                        .stroke(properties.foregroundColor, lineWidth: 2)
                        .background(properties.backgroundColor)
                )
                .cornerRadius(properties.cornerRadius)
        }
    }

    static func pillButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
                .padding()
                .background(
                    Capsule()
                        .stroke(properties.foregroundColor, lineWidth: 2)
                        .background(properties.backgroundColor)
                )
                .cornerRadius(properties.cornerRadius)
        }
    }

    static func plainButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
        }
    }

    static func linkButton(with properties: ButtonProperties) -> some View {
        Button(action: properties.action) {
            Text(properties.title)
                .foregroundColor(properties.foregroundColor)
                .font(.system(size: properties.fontSize))
        }
        .buttonStyle(LinkButtonStyle())
    }
}
