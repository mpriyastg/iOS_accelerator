//
//  BaseCheckBox.swift
//  InterviewSwiftUI
//
//  Created by admin on 13/06/23.
//

import SwiftUI

struct BaseCheckBox: View {
    @State var fontSize: CGFloat = 15
    @State var fontColor: Color = .blue
    @State var fontWeight: Font.Weight = .medium
    let option: String
    let isSelected: Bool
    let action: (Bool) -> Void

    var body: some View {
        Button(action: {
               action(!isSelected)
           }, label: {
               HStack {
                   Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                       .font(.system(size: fontSize))
                       .foregroundColor(isSelected ? .blue : .gray)
                   Text(option)
                       .font(.system(size: fontSize))
                       .foregroundColor(fontColor)
                       .fontWeight(fontWeight)
               }
           })
           .buttonStyle(CheckboxButtonStyle())
    }
}

struct CheckboxButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.primary)
            .font(.body)
            .padding()
    }
}
