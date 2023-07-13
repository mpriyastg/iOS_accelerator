//
//  ShareContentExample.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 07/06/23.
//

import SwiftUI
import UIKit

struct ShareContentExample: View {
    
    @StateObject private var permissionModel = Permission()

    let shareContent = ShareContent()
    @State var text = ""
    var body: some View {

        VStack(spacing: 20) {
            HStack {
                Text("Share Text:")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 15)
            HStack {
                Spacer()
                BaseTextField(placeHolder: "Enter Text", text: $text, textFieldType: .bordered)
                    .font(Font.system(size: 16))
                Spacer()
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            ButtonUtility.roundedCapsuleButton(with: ButtonProperties(
                title: "Share Text",
                foregroundColor: .white,
                backgroundColor: .blue,
                cornerRadius: 30,
                fontSize: 15,
                action: {
                    shareContent.share($text.wrappedValue)
                }
            ))
            Divider()
            HStack {
                Text("Share Image:")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 15)
            ButtonUtility.roundedCapsuleButton(with: ButtonProperties(
                title: "Select Image",
                foregroundColor: .white,
                backgroundColor: .blue,
                cornerRadius: 30,
                fontSize: 15,
                action: {
                    permissionModel.checkPhotoLibraryPermission()
                }
            ))
            .sheet(isPresented: $permissionModel.showPhotoLibrary, onDismiss: permissionModel.loadImage) {
                ImagePicker(image: $permissionModel.capturedImage,
                            sourceType: .photoLibrary,
                            showSettingsAlert: $permissionModel.showSettingsAlert)
            }
            .alert(isPresented: $permissionModel.showSettingsAlert) {
                Alert(
                    title: Text("Permission Required"),
                    message: Text("Please enable access to the photo library, camera, and files in Settings."),
                    primaryButton: .default(Text("Settings"), action: permissionModel.openSettings),
                    secondaryButton: .cancel()
                )
            }
            if let image = permissionModel.capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            ButtonUtility.roundedCapsuleButton(with: ButtonProperties(
                title: "Share Image",
                foregroundColor: .white,
                backgroundColor: .blue,
                cornerRadius: 30,
                fontSize: 15,
                action: {
                    shareContent.share(nil, permissionModel.capturedImage)
                }
            ))
            .opacity(($permissionModel.capturedImage.wrappedValue == nil) ? 0 : 1)
//            Button("Share Image") {
//                shareContent.share(nil, UIImage(named: "sampleImg"))
//            }
//            Button("Share URL") {
//                shareContent.share(nil, nil, NSURL(string: "https://www.stgit.com"))
//            }
//            Button("Share Text and Url") {
//                shareContent.share("Text", UIImage(named: "sampleImg"))
//            }
            Spacer()
        }
    }
}

struct ShareContentExample_Previews: PreviewProvider {
    static var previews: some View {
        ShareContentExample()
    }
}
