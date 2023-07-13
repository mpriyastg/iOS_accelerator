//
//  SampleAPI.swift
//  iOS-native-code
//
//  Created by admin on 05/07/23.
//

import SwiftUI
//import Alamofire

struct SampleAPI: View {
    @State var totomodel: TodosModel?
    @State var showLoading = false
    @State var loader = LoadingView(title: "Loading", size: .small)
    @State var showAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""

    var body: some View {
        ZStack {
            VStack {
                ButtonUtility.roundedBorderButton(with: ButtonProperties(
                    title: "Profile API call",
                    foregroundColor: .blue,
                    backgroundColor: .white,
                    cornerRadius: 10,
                    fontSize: 20,
                    action: {
//                        if NetworkReachabilityManager.getNetworkType() == .noConnection {
//                            alertTitle = "Network issue"
//                            alertMessage = "No network connection! Try again!"
//                            showAlert = true
//                            return
//                        }
//                        DispatchQueue.global(qos: .userInteractive).async {
//                            DispatchQueue.main.async {
//                                showLoading = true
//                                fetchUserProfile()
//                            }
//                        }
                    }
                ), borderColor: .blue, borderWidth: 2)
            }
            .padding()
            if showLoading {
                loader
            }
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
    func fetchUserProfile() {
//        let networkOperation = NetworkOperation()
//
//        networkOperation.request(.profile, method: .get, onSuccess: { (user: TodosModel) in
//            print(user)
//            alertTitle = "Success"
//            alertMessage = user.data.map({"\($0.employeeName) - \($0.employeeAge)"}).joined(separator: " | ")
//            showAlert = true
//            showLoading = false
//        }, onFailure: { error in
//            alertTitle = "Failed"
//            alertMessage = error.localizedDescription
//            showAlert = true
//            showLoading = false
//            print(error)
//        })
    }

}

struct SampleAPI_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
