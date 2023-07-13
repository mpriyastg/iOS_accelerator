//
//  Permission.swift
//  iOS-native-code
//
//  Created by admin on 20/06/23.
//

import Foundation
import SwiftUI
import PhotosUI
import MobileCoreServices
import UniformTypeIdentifiers

class Permission: ObservableObject {
    @Published var showPhotoLibrary = false
    @Published var showCamera = false
    @Published var showDocumentPicker = false
    @Published var capturedImage: UIImage?
    @Published var selectedDocument: URL?
    @Published var showSettingsAlert = false

    func loadImage() {
        guard capturedImage != nil else { return }
        // Use the selectedImage as needed (e.g., save it, display it, etc.)
    }

    func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(settingsURL)
    }

    func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            showPhotoLibrary = true
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    self.handlePhotoLibraryAuthorizationStatus(status)
                }
            }
        case .restricted, .denied:
            showSettingsAlert = true
        @unknown default:
            break
        }
    }

    func handlePhotoLibraryAuthorizationStatus(_ status: PHAuthorizationStatus) {
        switch status {
        case .authorized:
            showPhotoLibrary = true
        case .restricted, .denied:
            showSettingsAlert = true
        case .notDetermined, .limited:
            break
        @unknown default:
            break
        }
    }

    func checkCameraPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            showCamera = true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    self.handleCameraAuthorizationStatus(granted)
                }
            }
        case .restricted, .denied:
            showSettingsAlert = true
        @unknown default:
            break
        }
    }

    func handleCameraAuthorizationStatus(_ granted: Bool) {
        if granted {
            showCamera = true
        } else {
            showSettingsAlert = true
        }
    }

    func checkDocumentPickerPermission() {
        showDocumentPicker = true
    }

    func fileSize(for url: URL) -> String {
        let fileSize = try? url.resourceValues(forKeys: [.fileSizeKey]).fileSize
        if let fileSize = fileSize {
            let byteCountFormatter = ByteCountFormatter()
            byteCountFormatter.allowedUnits = [.useKB, .useMB, .useGB]
            byteCountFormatter.countStyle = .file
            return byteCountFormatter.string(fromByteCount: Int64(fileSize))
        } else {
            return "Unknown"
        }
    }
}
