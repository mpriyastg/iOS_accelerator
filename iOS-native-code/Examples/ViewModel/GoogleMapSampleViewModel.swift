//
//  GoogleMapSampleViewModel.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 28/06/23.
//

import Foundation
import CoreLocation

class GoogleMapSampleViewModel: NSObject, ObservableObject {
    @Published var markerLoc: [MarkerLocation] = [MarkerLocation]()
    @Published var sourceAddress: String = ""
    @Published var destinationAddress: String = ""
    @Published var selectedSourceCoordinate: CLLocationCoordinate2D? {
        didSet {
            if let coor = selectedSourceCoordinate {
                if let dest = selectedDestinationCoordinate {
                    markerLoc = [MarkerLocation(name: sourceAddress,
                                                latitude: coor.latitude,
                                                longitude: coor.longitude),
                                 MarkerLocation(name: destinationAddress,
                                                latitude: dest.latitude,
                                                longitude: dest.longitude)]
                } else {
                    markerLoc = [MarkerLocation(name: sourceAddress,
                                                latitude: coor.latitude,
                                                longitude: coor.longitude)]
                }
            }
        }
    }
    @Published var selectedDestinationCoordinate: CLLocationCoordinate2D? {
        didSet {
            if let coor = selectedDestinationCoordinate {
                if let source = selectedSourceCoordinate {
                    markerLoc = [MarkerLocation(name: sourceAddress,
                                                latitude: source.latitude,
                                                longitude: source.longitude),
                                 MarkerLocation(name: destinationAddress,
                                                latitude: coor.latitude,
                                                longitude: coor.longitude)]
                } else {
                    markerLoc = [MarkerLocation(name: destinationAddress,
                                                latitude: coor.latitude,
                                                longitude: coor.longitude)]
                }
            }
        }
    }
}
