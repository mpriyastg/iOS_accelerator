//
//  BaseTextField.swift
//  iOS-native-code
//
//  Created by admin on 25/05/23.
//

import SwiftUI

enum TextFieldType {
    case plain
    case rounded
    case underlined
    case topPlaceholder
    case withImage
    case bordered
}

struct BaseTextField: View {

    @State var placeHolder = ""
    @Binding var text : String
    @State var textFieldType: TextFieldType = .plain // textfield type
    @State var validationLabel = false // should be true to display error message
    @State var errorMessage = "" // pass error message here
    @State var rightImg: Image? // pass it for withImage type
    @State var leftImg: Image? // pass it for withImage type

    var body: some View {
        VStack {
            if textFieldType == .topPlaceholder && text != ""{
                HStack {
                    Text(placeHolder)
                        .font(Font.system(size: 10))
                        .fontWeight(.light)
                    Spacer()
                }

            }
            if textFieldType == .rounded {
                TextField(placeHolder, text: $text)
                    .modifier(BaseTextFieldModifier(text: $text))
                    .textFieldStyle(.roundedBorder)
            } else if textFieldType == .bordered {
                TextField(placeHolder, text: $text)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Asset.Assets.black.color,
                                                                               lineWidth: 0.5))
                    .modifier(BaseTextFieldModifier(text: $text))
            } else if textFieldType == .withImage {
                HStack {
                    if leftImg != nil {
                        leftImg
                            .padding(.leading, 10)
                            .frame(width: 30)
                    }
                    TextField(placeHolder, text: $text)
                        .modifier(BaseTextFieldModifier(text: $text))
                        .padding()
                    if rightImg != nil {
                        rightImg
                            .padding(.trailing, 5)
                            .frame(width: 30)
                    }
                    Spacer()
                }
                .frame(height: 40)

                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Asset.Assets.black.color, lineWidth: 0.5))

            } else {
                TextField(placeHolder, text: $text)
                    .padding(.top, 10)
                    .padding(.leading, 5)
                    .modifier(BaseTextFieldModifier(text: $text))
            }

            if textFieldType == .topPlaceholder || textFieldType == .underlined {
                Divider().background(Asset.Assets.black.color)
            }

            if validationLabel {
                HStack {
                    Text(errorMessage)
                        .font(Font.system(size: 10))
                        .fontWeight(.light)
                        .foregroundColor(.red)
                        .padding(.leading, 5)
                    Spacer()
                }
            }
        }

    }
}

struct BaseTextField_Previews: PreviewProvider {
    static var previews: some View {
        BaseTextField(text: .constant(""))
    }
}

struct BaseTextFieldModifier: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
            content
    }
}

extension View {
    func textFieldType(_ type: TextFieldType) -> some View {
        modifier(BaseTextFieldModifier(text: .constant("")))
    }

    func includeValidationLabel() -> some View {
        modifier(BaseTextFieldModifier(text: .constant("")))
    }
}
