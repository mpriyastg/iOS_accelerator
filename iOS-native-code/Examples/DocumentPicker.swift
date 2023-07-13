//
//  DocumentPicker.swift
//  iOS-native-code
//
//  Created by admin on 20/06/23.
//

import Foundation
import SwiftUI
import PhotosUI
import MobileCoreServices
import UniformTypeIdentifiers
struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var selectedDocument: URL?
    @Binding var showSettingsAlert: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.data], asCopy: true)
        documentPicker.delegate = context.coordinator
        return documentPicker
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: DocumentPicker

        init(_ parent: DocumentPicker) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.selectedDocument = urls.first
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            controller.dismiss(animated: true) {
                self.parent.showSettingsAlert = true
            }
        }
    }
}
