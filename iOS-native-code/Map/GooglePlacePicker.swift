//
//  GooglePlacePicker.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 27/06/23.
//

import Foundation
import UIKit
import SwiftUI
import GooglePlaces

struct GooglePlacePicker: UIViewControllerRepresentable {

    func makeCoordinator() -> GooglePlacesCoordinator {
        GooglePlacesCoordinator(self)
    }

    @Environment (\.presentationMode) var presentationMode
    @Binding var address: String
    @Binding var selectedCoordinate: CLLocationCoordinate2D?

    init(selectedCoordinate: Binding<CLLocationCoordinate2D?>?, address: Binding<String>) {
        self._selectedCoordinate = selectedCoordinate ?? Binding.constant(nil)
        self._address = address
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<GooglePlacePicker>) -> GMSAutocompleteViewController {
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = context.coordinator
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(UInt64(UInt(GMSPlaceField.name.rawValue) |
                                                                         UInt(GMSPlaceField.placeID.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))))
        autoCompleteController.placeFields = fields
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autoCompleteController.autocompleteFilter = filter
        return autoCompleteController
    }

    func updateUIViewController(_ uiViewController: GMSAutocompleteViewController, context: Context) {

    }

}

class GooglePlacesCoordinator: NSObject, UINavigationControllerDelegate, GMSAutocompleteViewControllerDelegate {

    var parent: GooglePlacePicker

    init(_ parent: GooglePlacePicker) {

        self.parent = parent
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        DispatchQueue.main.async {
            self.parent.address = place.name ?? ""
            self.parent.selectedCoordinate = place.coordinate
            print("The selected place is: \(place.coordinate)")
            self.parent.presentationMode.wrappedValue.dismiss()

        }
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error ::  \(error.localizedDescription)")
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        parent.presentationMode.wrappedValue.dismiss()
    }

}
