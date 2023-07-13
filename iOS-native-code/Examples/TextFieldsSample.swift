//
//  TextFieldsSample.swift
//  iOS-native-code
//
//  Created by admin on 25/05/23.
//

import SwiftUI

struct TextFieldsSample: View {

    @State var text = ""
    var body: some View {
        ScrollView {
            VStack {
                Group {

                    Text("TextFields")
                        .font(Font.system(size: 22))
                        .fontWeight(.bold)
                    Spacer().frame(height: 50)
                    HStack {
                        Text("Plain TextField:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)
                    BaseTextField(placeHolder: "Enter Name", text: $text, textFieldType: .plain)
                        .padding()
                    Divider()
                    Spacer().frame(height: 50)

                    HStack {
                        Text("TextField with error label:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)
                    BaseTextField(placeHolder: "Enter Name",
                                  text: $text,
                                  textFieldType: .plain,
                                  validationLabel: true,
                                  errorMessage: "Enter valid name")
                        .padding()
                    Divider()
                    Spacer().frame(height: 50)
                }

                Group {

                    HStack {
                        Text("TextField with placeholder label:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)

                    BaseTextField(placeHolder: "Enter Name", text: $text, textFieldType: .topPlaceholder)
                        .padding()

                    Divider()
                    Spacer().frame(height: 50)

                    HStack {
                        Text("Underlined TextField:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)

                    BaseTextField(placeHolder: "Enter Name", text: $text, textFieldType: .underlined)
                        .padding()
                    Divider()
                    Spacer().frame(height: 50)
                }
                Group {
                    HStack {
                        Text("Rounded TextField:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)

                    BaseTextField(placeHolder: "Enter Name", text: $text, textFieldType: .rounded)
                        .padding()
                    Divider()
                    Spacer().frame(height: 50)

                    HStack {
                        Text("TextField with left icon:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)
                    BaseTextField(placeHolder: "Enter Name",
                                  text: $text,
                                  textFieldType: .withImage,
                                  leftImg: Image(systemName: "person"))
                        .padding()

                    Divider()
                    Spacer().frame(height: 50)

                }

                Group {

                    HStack {
                        Text("TextField with right icon:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)
                    BaseTextField(placeHolder: "Enter Name",
                                  text: $text,
                                  textFieldType: .withImage,
                                  rightImg: Image(systemName: "xmark.circle"))
                        .padding()

                    Divider()
                    Spacer().frame(height: 50)

                    HStack {
                        Text("TextField with both left and right icon:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)
                    BaseTextField(placeHolder: "Enter Name",
                                  text: $text,
                                  textFieldType: .withImage,
                                  rightImg: Image(systemName: "xmark.circle"),
                                  leftImg: Image(systemName: "person"))
                        .padding()

                    Divider()
                    Spacer().frame(height: 50)
                }
                Group {

                    HStack {
                        Text("Underlined TextField with background:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)

                    BaseTextField(placeHolder: "Enter Name", text: $text, textFieldType: .underlined)
                        .background(Asset.Assets.textBg.color)
                        .padding()
                    Divider()
                    Spacer().frame(height: 50)

                    HStack {
                        Text("Bordered TextField:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.leading, 15)

                    BaseTextField(placeHolder: "Enter Name", text: $text, textFieldType: .bordered)
                        .padding()
                    Divider()
                    Spacer().frame(height: 50)
                }
            }
        }
    }
}

struct TextFieldsSample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsSample()
    }
}
