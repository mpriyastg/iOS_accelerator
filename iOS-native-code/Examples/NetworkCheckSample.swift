//
//  NetworkCheckSample.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 08/07/23.
//

import SwiftUI
import Alamofire

struct NetworkCheckSample: View {
    @State var showAlert = false
    @State var alertTitle = "Network check!"
    @State var alertMessage = ""
    var body: some View {
        ZStack {
            ButtonUtility.roundedCapsuleButton(with: ButtonProperties(
                title: "Check Network Connectivity",
                foregroundColor: .white,
                backgroundColor: .blue,
                cornerRadius: 30,
                fontSize: 15,
                action: {
                    let networkType = NetworkReachabilityManager.getNetworkType()
                    switch networkType {
                    case .noConnection:
                        alertMessage = "No connection"
                    case .unknown:
                        alertMessage = "Connection unknown"
                    default:
                        alertMessage = "Connected to network"
                    }
                    showAlert = true
                }
            ))
            if showAlert {
                AlertView(alertTitle: alertTitle, alertMessage: alertMessage, primaryButtonTitle: "Okay", primaryAction: buttonAction, type: .singleButton, textFieldValue: .constant(""))
                    .animation(.easeOut, value: 1)
                    .transition(.opacity)
            }
        }
    }
    func buttonAction() {
        showAlert = false
    }
}

struct NetworkCheckSample_Previews: PreviewProvider {
    static var previews: some View {
        NetworkCheckSample()
    }
}
