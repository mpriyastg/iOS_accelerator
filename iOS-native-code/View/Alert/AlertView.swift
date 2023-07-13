//
//  AlertView.swift
//  iOS-native-code
//
//  Created by admin on 30/05/23.
//

import SwiftUI
import Foundation

public typealias Action = () -> Void

enum AlertViewType {
    case singleButton
    case twoButton
    case threeButton
}

struct AlertView: View {
    let alertTitle: String
    let alertMessage: String
    var iconName: String = ""
    let primaryButtonTitle: String
    let primaryAction: Action
    var secondaryButtonTitle: String = ""
    var secondaryAction: Action = {}
    var thirdButtonTitle: String = ""
    var thirdAction: Action = {}
    let type: AlertViewType
    var hasTextField: Bool = false
    @Binding var textFieldValue: String?
    var body: some View {
        ZStack {
            Asset.Assets.alertBg.color
                .animation(.easeOut)
                .transition(.opacity)

            VStack {
                Spacer()

                VStack {

                    VStack(alignment: .center) {

                        // MARK: - Title
                        Text(alertTitle)
                            .font(DesignConstants.titleFont)
                            .frame(height: 28)
                            .padding(.top, 20)
                            .padding(.bottom)

                        VStack(spacing: DesignConstants.cardSpacing) {

                            VStack(spacing: 14) {

                                Divider()
                                // MARK: - Icon
                                if !iconName.isEmpty {
                                    Image(iconName)
                                        .frame(width: DesignConstants.iconWidth, height: DesignConstants.iconHeight)
                                }
                            }

                            // MARK: - Message
                            Text(alertMessage)
                                .multilineTextAlignment(.center)
                                .font(DesignConstants.messageFont)
                                .lineSpacing(DesignConstants.lineSpacing)

                            if hasTextField {
                                BaseTextField(placeHolder: "", text: $textFieldValue.toUnwrapped(defaultValue: ""), textFieldType: .bordered)
                            }
                            Divider()
                        }

                        if type == .threeButton {
                            // MARK: - Button
                            VStack(alignment: .center) {

                                // MARK: Third Button

                                Button(thirdButtonTitle) {
                                    thirdAction()
                                }
                                .frame(height: DesignConstants.buttonHeight)
                                .font(DesignConstants.secondaryButtonTextFont)
                                Divider()

                                // MARK: Secondary Button

                                Button(secondaryButtonTitle) {
                                    secondaryAction()
                                }
                                .frame(height: DesignConstants.buttonHeight)
                                .font(DesignConstants.secondaryButtonTextFont)
                                Divider()

                                // MARK: Primary Button

                                Button(primaryButtonTitle) {
                                    primaryAction()
                                }
                                .frame(height: DesignConstants.buttonHeight)
                                .font(DesignConstants.primaryButtonTextFont)}
                                .padding([.top, .bottom], 6)
                        } else {
                            // MARK: - Button
                            HStack(alignment: .center) {

                                if type == .twoButton {
                                    // MARK: Secondary Button
                                    Spacer()

                                    Button(secondaryButtonTitle) {
                                        secondaryAction()
                                    }
                                    .frame(height: DesignConstants.buttonHeight)
                                    .font(DesignConstants.secondaryButtonTextFont)
                                    Spacer()
                                }

                                // MARK: Primary Button
                                Spacer()

                                Button(primaryButtonTitle) {
                                    primaryAction()
                                }
                                .frame(height: DesignConstants.buttonHeight)
                                .font(DesignConstants.primaryButtonTextFont)

                                Spacer()
                            }
                            .padding([.top, .bottom], 6)
                        }
                    }
                    .padding([.leading, .trailing])

                }
                .background(Asset.Assets.white.color)
                .cornerRadius(DesignConstants.cornerRadius)
                .padding([.leading, .trailing], DesignConstants.containerLeadingAndTrailingPadding)
                .padding([.top, .bottom], DesignConstants.containerTopAndBottomPadding)
                .zIndex(2)
                Spacer()
            }
        }
        .ignoresSafeArea()
}

    struct DesignConstants {
        static let cardSpacing: CGFloat = 20
        static let titleFont = Font.system(size: 26)
        static let messageFont = Font.system(size: 16)
        static let buttonHeight: CGFloat = 44
        static let primaryButtonTextFont = Font.system(size: 18)
        static let secondaryButtonTextFont = Font.system(size: 18)
        static let containerLeadingAndTrailingPadding: CGFloat = 30
        static let containerTopAndBottomPadding: CGFloat = 20
        static let cardBottomPadding: CGFloat = 10
        static let cornerRadius: CGFloat = 10
        static let lineSpacing: CGFloat = 5
        static let shadowRadius: CGFloat = 5
        static let iconWidth: CGFloat = 40
        static let iconHeight: CGFloat = 40
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(alertTitle: "",
                  alertMessage: "",
                  iconName: "",
                  primaryButtonTitle: "",
                  primaryAction: {},
                  secondaryButtonTitle: "",
                  secondaryAction: {},
                  thirdButtonTitle: "",
                  thirdAction: {},
                  type: .singleButton,
                  textFieldValue: .constant(""))
    }
}
extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
