//
//  BaseLabel.swift
//  InterviewSwiftUI
//
//  Created by admin on 31/05/23.
//

import SwiftUI

enum TextType {
    case plain
    case grouped
}

struct BaseLabel: View {
    @State var textType: TextType = .plain
    @State var text = ""
    @State var fontSize: CGFloat = 15
    @State var fontColor: Color = .blue
    @State var fontWeight: Font.Weight = .medium
    @State var isUnderLine: Bool = false
    @State var texts: [(String, Color)] = [("Hello,", .blue)]
    var body: some View {
        VStack {
            if textType == .plain {
                Text(text)
                    .font(.system(size: fontSize))
                    .foregroundColor(fontColor)
                    .fontWeight(fontWeight)
                    .underline(isUnderLine, color: fontColor)
            }
            VStack {
                if textType == .grouped {
                    ForEach(texts, id: \.0) { text, color in
                        Text(text)
                            .font(.system(size: fontSize))
                            .foregroundColor(color)
                            .fontWeight(fontWeight)
                            .underline(isUnderLine, color: fontColor)
                    }
                }
            }
        }
    }
}

struct StrikethroughTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Rectangle()
                        .frame(height: 1)
                        .offset(y: geometry.size.height / 2)
                }
            )
    }
}
extension View {
    func strikethrough() -> some View {
        self.modifier(StrikethroughTextModifier())
    }
}

struct BaseLabel_Previews: PreviewProvider {
    static var previews: some View {
        BaseLabel(texts: [("Hello,", .blue)])
    }
}
