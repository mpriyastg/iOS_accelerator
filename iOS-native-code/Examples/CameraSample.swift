//
//  CameraSample.swift
//  iOS-native-code
//
//  Created by admin on 20/06/23.
//

import Foundation
import SwiftUI
import PhotosUI
import MobileCoreServices
import UniformTypeIdentifiers

struct CameraSample: View {
    @StateObject private var viewModel = Permission()

    var body: some View {
        VStack {
            HStack {
                if let image = viewModel.capturedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                } else {
                    Color.clear
                }

                if let document = viewModel.selectedDocument {
                    VStack(alignment: .leading) {
                        Text("Selected Document:")
                        Text("Name: \(document.lastPathComponent)")
                        Text("Size: \(viewModel.fileSize(for: document))")
                    }
                } else {
                    Color.clear
                }
            }
            .padding()

            HStack {
                Button("Choose Photo") {
                    viewModel.checkPhotoLibraryPermission()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Take Photo") {
                    viewModel.checkCameraPermission()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .sheet(isPresented: $viewModel.showCamera, onDismiss: {
                    if viewModel.capturedImage == nil {
                        viewModel.showPhotoLibrary = false
                    }
                }, content: {
                    ImagePicker(image: $viewModel.capturedImage,
                                sourceType: .camera,
                                showSettingsAlert: $viewModel.showSettingsAlert)
                })
                Button("Choose Document") {
                    viewModel.checkDocumentPickerPermission()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .sheet(isPresented: $viewModel.showDocumentPicker, onDismiss: {
                    if viewModel.selectedDocument == nil {
                        viewModel.showPhotoLibrary = false
                    }
                }, content: {
                    DocumentPicker(selectedDocument: $viewModel.selectedDocument,
                                   showSettingsAlert: $viewModel.showSettingsAlert)
                })
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.showPhotoLibrary, onDismiss: viewModel.loadImage) {
            ImagePicker(image: $viewModel.capturedImage,
                        sourceType: .photoLibrary,
                        showSettingsAlert: $viewModel.showSettingsAlert)
        }
        .alert(isPresented: $viewModel.showSettingsAlert) {
            Alert(
                title: Text("Permission Required"),
                message: Text("Please enable access to the photo library, camera, and files in Settings."),
                primaryButton: .default(Text("Settings"), action: viewModel.openSettings),
                secondaryButton: .cancel()
            )
        }
    }
}
