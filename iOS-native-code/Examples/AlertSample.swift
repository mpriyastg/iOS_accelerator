//
//  AlertSample.swift
//  iOS-native-code
//
//  Created by admin on 30/05/23.
//

import SwiftUI

struct AlertSample: View {
    @State var showPopupWithPrimaryButton = false
    @State var showPopupWithSecondaryButton = false
    @State var showPopupWithThreeButtons = false
    @State var showPopupWithIcon = false
    @State var showPopupWithTextField = false

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Alerts")
                        .font(Font.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                }
                Button("Show Alert with single button") {
                    showPopupWithPrimaryButton = true
                }
                .frame(height: 35)
                .foregroundColor(Color.blue)
                .padding(7)
                Button("Show alert with two button") {
                    showPopupWithSecondaryButton = true
                }
                .frame(height: 35)
                .foregroundColor(Color.blue)
                .padding(7)
                Button("Show alert with three button") {
                    showPopupWithThreeButtons = true
                }
                .frame(height: 35)
                .foregroundColor(Color.blue)
                .padding(7)
                Button("Show alert with icon") {
                    showPopupWithIcon = true
                }
                .frame(height: 35)
                .foregroundColor(Color.blue)
                .padding(7)
                Button("Show alert with textfield") {
                    showPopupWithTextField = true
                }
                .frame(height: 35)
                .foregroundColor(Color.blue)
                .padding(7)
                Spacer()
            }
            if showPopupWithPrimaryButton {
                AlertView(alertTitle: "Alert!",
                          alertMessage: "Alert with single button",
                          primaryButtonTitle: "Okay",
                          primaryAction: buttonAction,
                          type: .singleButton,
                          textFieldValue: .constant(""))
                .animation(.easeOut, value: 1)
                .transition(.opacity)
            }
            if showPopupWithSecondaryButton {
                AlertView(alertTitle: "Alert",
                          alertMessage: "Alert with two buttons",
                          primaryButtonTitle: "No",
                          primaryAction: buttonAction,
                          secondaryButtonTitle: "Yes",
                          secondaryAction: buttonAction,
                          type: .twoButton,
                          textFieldValue: .constant(""))
                    .animation(.easeOut, value: 1)
                    .transition(.opacity)
            }
            if showPopupWithThreeButtons {
                AlertView(alertTitle: "Alert",
                          alertMessage: "Alert with three buttons",
                          primaryButtonTitle: "Allow",
                          primaryAction: buttonAction,
                          secondaryButtonTitle: "Allow once",
                          secondaryAction: buttonAction,
                          thirdButtonTitle: "Never",
                          thirdAction: buttonAction,
                          type: .threeButton,
                          textFieldValue: .constant(""))
                    .animation(.easeOut, value: 1)
                    .transition(.opacity)
            }
            if showPopupWithIcon {
                AlertView(alertTitle: "Alert",
                          alertMessage: "Alert with three buttons",
                          iconName: Asset.Assets.alert.name,
                          primaryButtonTitle: "Allow",
                          primaryAction: buttonAction,
                          secondaryButtonTitle: "Allow once",
                          secondaryAction: buttonAction,
                          thirdButtonTitle: "Never",
                          thirdAction: buttonAction,
                          type: .threeButton,
                          textFieldValue: .constant(""))
                    .animation(.easeOut, value: 1)
                    .transition(.opacity)
            }
            if showPopupWithTextField {
                AlertView(alertTitle: "Alert",
                          alertMessage: "Alert with Text input field",
                          primaryButtonTitle: "No",
                          primaryAction: buttonAction,
                          secondaryButtonTitle: "Yes",
                          secondaryAction: buttonAction,
                          type: .twoButton,
                          hasTextField: true,
                          textFieldValue: .constant(""))
                    .animation(.easeOut, value: 1)
                    .transition(.opacity)
            }
        }
    }
    func buttonAction() {
        showPopupWithPrimaryButton = false
        showPopupWithSecondaryButton = false
        showPopupWithThreeButtons = false
        showPopupWithIcon = false
        showPopupWithTextField = false
    }
}

struct AlertSample_Previews: PreviewProvider {
    static var previews: some View {
        AlertSample()
    }
}
