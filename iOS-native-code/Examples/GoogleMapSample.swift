//
//  GoogleMapSample.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 27/06/23.
//

import Foundation
import SwiftUI
import CoreLocation
import GoogleMaps

enum PlacePickerType {
    case source
    case destination
}

struct GoogleMapSample: View {
    @State var openPlacePicker = false
    @StateObject var viewModel = GoogleMapSampleViewModel()
    @State var placePickerType = PlacePickerType.source

    var body: some View {
        ZStack {
            VStack {

                GoogleMapsView(markerLocations: $viewModel.markerLoc,
                               sourceLocation: $viewModel.selectedSourceCoordinate,
                               destinationLocation: $viewModel.selectedDestinationCoordinate)
                    .ignoresSafeArea()
            }
            VStack {
                TextField("Search Source", text: $viewModel.sourceAddress)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .onTapGesture {
                        openPlacePicker = true
                        placePickerType = .source
                    }
                TextField("Search Destination", text: $viewModel.destinationAddress)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .onTapGesture {
                        openPlacePicker = true
                        placePickerType = .destination
                    }
                Color.clear
            }
        }
        .sheet(isPresented: $openPlacePicker) {
            if placePickerType == .source {
                GooglePlacePicker(selectedCoordinate: $viewModel.selectedSourceCoordinate,
                                  address: $viewModel.sourceAddress)
            } else {
                GooglePlacePicker(selectedCoordinate: $viewModel.selectedDestinationCoordinate,
                                  address: $viewModel.destinationAddress)
            }
        }
    }
}

struct GoogleMapSample_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapSample()
    }
}
