//
//  GoogleMapsView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 27/06/23.
//

import Foundation
import GoogleMaps
import SwiftUI

struct GoogleMapsView: UIViewRepresentable {
    typealias UIViewType = GMSMapView
    @ObservedObject var locationManager = LocationManager()
    @Binding var markerLocations: [MarkerLocation]
    @Binding var sourceLocation: CLLocationCoordinate2D?
    @Binding var destinationLocation: CLLocationCoordinate2D?
    private let zoom: Float = 14.0
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: locationManager.latitude,
                                       longitude: locationManager.longitude,
                                       zoom: zoom)
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        mapView.animate(toLocation:
                            CLLocationCoordinate2D(
                                latitude: locationManager.latitude,
                                longitude: locationManager.longitude))
        return mapView
    }
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude,
                                                           longitude: locationManager.longitude))
        if !markerLocations.isEmpty {
            mapView.clear()
            var bounds = GMSCoordinateBounds()
            for loc in markerLocations {
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: loc.latitude, longitude: loc.longitude)
                marker.title = loc.name
                marker.map = mapView
                bounds = bounds.includingCoordinate(marker.position)
            }
            mapView.setMinZoom(1, maxZoom: 15)
            let update = GMSCameraUpdate.fit(bounds, withPadding: 80)
            mapView.animate(with: update)
            mapView.setMinZoom(1, maxZoom: 20)
            if let source = sourceLocation, let dest = destinationLocation {
                locationManager.getRouteSteps(from: CLLocationCoordinate2D(latitude: source.latitude,
                                                                           longitude: source.longitude),
                                              to: CLLocationCoordinate2D(latitude: dest.latitude,
                                                                         longitude: dest.longitude)) { polyStr, error in
                    if error == nil && polyStr != nil {
                        DispatchQueue.main.async {
                            let path = GMSPath(fromEncodedPath: polyStr!)
                            let polyline = GMSPolyline(path: path)
                            polyline.strokeWidth = 3.0
                            polyline.map = mapView
                            let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: source,
                                                                                       coordinate: dest))
                            mapView.moveCamera(cameraUpdate)
                            let currentZoom = mapView.camera.zoom
                            mapView.animate(toZoom: currentZoom - 1.4)
                        }
                    }
                }
            }
        }
    }
}

struct MarkerLocation {
    let name: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}
