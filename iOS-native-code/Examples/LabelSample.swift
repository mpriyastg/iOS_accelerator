//
//  labelSample.swift
//  InterviewSwiftUI
//
//  Created by admin on 31/05/23.
//

import SwiftUI

struct LabelSample: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 20) {
                    Group {
                        HStack {
                            Spacer()
                            Text("Labels")
                                .font(Font.system(size: 22))
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                    Group {
                        // Plain text
                        Text("Plain text:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        BaseLabel(textType: .plain,
                                  text: "Hello World",
                                  fontSize: 25,
                                  fontColor: .red,
                                  fontWeight: .regular)
                        Divider()
                    }
                    Group {
                        // Underline text
                        Text("Text with underline:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        BaseLabel(textType: .plain,
                                  text: "UnderLine Text",
                                  fontSize: 25,
                                  fontColor: .blue,
                                  fontWeight: .regular,
                                  isUnderLine: true)
                        Divider()
                    }
                    Group {
                        // Strike the text
                        Text("Strike the text:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)

                        BaseLabel(textType: .plain,
                                  text: "UnderLine Text",
                                  fontSize: 25,
                                  fontColor: .green,
                                  fontWeight: .regular).strikethrough()
                        Divider()
                    }
                    Group {
                        // Underline with Strike the text
                        Text("Underline with Strike the text:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)

                        BaseLabel(textType: .plain,
                                  text: "Text",
                                  fontSize: 25,
                                  fontColor: .green,
                                  fontWeight: .regular,
                                  isUnderLine: true).strikethrough()
                        Divider()
                    }
                    // Group text
                    Text("Spannable text:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    HStack {
                        BaseLabel(textType: .plain,
                                  text: "This ",
                                  fontSize: 25,
                                  fontColor: .red,
                                  fontWeight: .regular)
                        BaseLabel(textType: .plain,
                                  text: "is ",
                                  fontSize: 25,
                                  fontColor: Asset.Assets.black.color,
                                  fontWeight: .regular)
                        BaseLabel(textType: .plain,
                                  text: "JetPack ",
                                  fontSize: 25,
                                  fontColor: .green,
                                  fontWeight: .regular,
                                  isUnderLine: true)

                    }
                    Divider()
                }.padding()
                VStack(alignment: .leading, spacing: 20) {
                    // Strike the text and plain
                    Text("Strike the text and plain:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    HStack {
                        BaseLabel(textType: .plain,
                                  text: "UnderLine",
                                  fontSize: 25,
                                  fontColor: .green,
                                  fontWeight: .regular).strikethrough()
                        BaseLabel(textType: .plain, text: "text", fontSize: 25, fontColor: .gray, fontWeight: .regular)

                    }
                    Divider()
                    // Strike the text and sub value
                    Text("Strike the text and sub value:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    HStack {
                        VStack {
                            HStack {
                                BaseLabel(textType: .plain,
                                          text: "Original Price",
                                          fontSize: 25,
                                          fontColor: .green,
                                          fontWeight: .regular).strikethrough()
                                Spacer()
                            }
                            HStack {
                                BaseLabel(textType: .plain,
                                          text: "$99.99",
                                          fontSize: 18,
                                          fontColor: .blue,
                                          fontWeight: .regular).font(.subheadline)
                                Spacer()
                            }
                            Divider()
                        }

                    }

                    // Url Navigation
                    Text("Text with click:")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                    BaseLabel(textType: .plain,
                              text: "Terms & condition",
                              fontSize: 25,
                              fontColor: .blue,
                              fontWeight: .regular,
                              isUnderLine: true).onTapGesture {
                        guard let url = URL(string: "https://openai.com") else { return }
                        UIApplication.shared.open(url)
                    }
                }.padding()

            }
        }
    }
}

struct LabelSample_Previews: PreviewProvider {
    static var previews: some View {
        LabelSample()
    }
}
