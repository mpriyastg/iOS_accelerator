//
//  labelSample.swift
//  InterviewSwiftUI
//
//  Created by admin on 31/05/23.
//

import SwiftUI

struct LabelSample: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 20) {
                    // Plain text
                    Text("Plain text:")
                        .customFontSize(22)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    BaseLabel(textType: .plain,
                              text: "Hello World",
                              fontSize: 18,
                              fontColor: .red,
                              fontWeight: .regular)
                    Divider()
                    // Underline text
                    Text("Text with underline:")
                        .customFontSize(22)
                       .foregroundColor(.black)
                        .fontWeight(.heavy)
                    BaseLabel(textType: .plain,
                              text: "UnderLine Text",
                              fontSize: 18,
                              fontColor: .blue,
                              fontWeight: .regular,
                              isUnderLine: true)
                    Divider()
                    // Strike the text
                    Text("Strike the text:")
                        .customFontSize(22)
                       .foregroundColor(.black)
                        .fontWeight(.heavy)
                    BaseLabel(textType: .plain,
                              text: "UnderLine Text",
                              fontSize: 18,
                              fontColor: .green,
                              fontWeight: .regular).strikethrough()
                    Divider()
                    VStack(alignment: .leading) {
                        // Group text
                        Text("Group text:")
                            .customFontSize(22)
                           .foregroundColor(.black)
                            .fontWeight(.heavy)
                        BaseLabel(textType: .grouped,
                                  fontSize: 18,
                                  fontWeight: .regular,
                                  texts: [("Hello,", .red), ("World", .black), ("Texts", .blue)])
                        Divider()
                    }
                }.padding()
                VStack(alignment: .leading, spacing: 20) {
                    // Strike the text and plain
                    Text("Strike the text and plain:")
                        .customFontSize(22)
                      .foregroundColor(.black)
                        .fontWeight(.heavy)
                    HStack {
                        BaseLabel(textType: .plain,
                                  text: "UnderLine",
                                  fontSize: 18,
                                  fontColor: .green,
                                  fontWeight: .regular).strikethrough()
                        BaseLabel(textType: .plain,
                                  text: "text",
                                  fontSize: 18,
                                  fontColor: .gray,
                                  fontWeight: .regular)
                    }
                    Divider()
                    // Strike the text and sub value
                    Text("Strike the text and sub value:")
                        .customFontSize(22)
                      .foregroundColor(.black)
                        .fontWeight(.heavy)
                    HStack {
                        VStack {
                            BaseLabel(textType: .plain,
                                      text: "Original Price",
                                      fontSize: 18,
                                      fontColor: .green,
                                      fontWeight: .regular).strikethrough()

                            BaseLabel(textType: .plain,
                                      text: "$99.99",
                                      fontSize: 16,
                                      fontColor: .blue,
                                      fontWeight: .regular).font(.subheadline)
                        }

                    }
                    Divider()
                    // Url Navigation
                    Text("Url Navigation:")
                        .customFontSize(22)
                       .foregroundColor(.black)
                        .fontWeight(.heavy)
                    BaseLabel(textType: .plain,
                              text: "Visit OpenAI",
                              fontSize: 18,
                              fontColor: .blue,
                              fontWeight: .regular,
                              isUnderLine: true).onTapGesture {
                        guard let url = URL(string: "https://openai.com") else { return }
                        UIApplication.shared.open(url)

                    }
                }.padding()

            }.padding()
        }
    }
}

struct LabelSample_Previews: PreviewProvider {
    static var previews: some View {
        LabelSample()
    }
}
