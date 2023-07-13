//
//  LocationManager.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 25/06/23.
//

import Foundation
import Combine
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKLocalSearchCompleterDelegate {
    let manager = CLLocationManager()
    @Published var currentLocation: CLLocation? {
        willSet { objectWillChange.send() }
    }
    var latitude: CLLocationDegrees {
        return currentLocation?.coordinate.latitude ?? 0
    }
    var longitude: CLLocationDegrees {
        return currentLocation?.coordinate.longitude ?? 0
    }
    @Published var region: MKCoordinateRegion
    @Published var searchedRegion: MKCoordinateRegion?
    @Published var location: CLLocationCoordinate2D?
    @Published var name: String = ""
    @Published var search: String = ""
    @Published var searchResults = [MKLocalSearchCompletion]()
    @Published var annotations = [City(name: "Tower of London",
                                       coordinate: CLLocationCoordinate2D(latitude: 51.508,
                                                                          longitude: -0.076))]
    var publisher: AnyCancellable?
    var searchCompleter = MKLocalSearchCompleter()
    override init() {
        let latitude = 18
        let longitude = 22
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(latitude),
                longitude: CLLocationDegrees(longitude)
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.25,
                longitudeDelta: 0.25
            )
        )
        super.init()
        manager.delegate = self
        searchCompleter.delegate = self
        requestLocation()
        self.publisher = $search.receive(on: RunLoop.main).sink(receiveValue: { [weak self] (str) in
            self?.searchCompleter.queryFragment = str
        })
    }
    func requestLocation() {
        manager.requestLocation()
        manager.requestAlwaysAuthorization()
    }
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else { return }
        self.currentLocation = loc
        location = locations.first?.coordinate
        self.region.center.latitude = self.location?.latitude ?? CLLocationDegrees(0)
        self.region.center.longitude = self.location?.longitude ?? CLLocationDegrees(0)
    }
    func getDistance(searchResult: MKLocalSearchCompletion, completionHandler: @escaping (String) -> Void) {
        let searchRequest = MKLocalSearch.Request(completion: searchResult)
        let search = MKLocalSearch(request: searchRequest)
        var placeMarkCoordinates: CLLocation = CLLocation(latitude: 0, longitude: 0)
        search.start { (response, _) in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else {
                return
            }
            placeMarkCoordinates = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let targetloc = CLLocation(latitude: self.location?.latitude ?? 0,
                                       longitude: self.location?.longitude ?? 0)
            let distance = targetloc.distance(from: placeMarkCoordinates).toKilometers()
            let formattedDistance = String(format: "Distance: %.2f KM", distance)
            completionHandler(formattedDistance)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    func getRouteSteps(from source: CLLocationCoordinate2D,
                       to destination: CLLocationCoordinate2D,
                       completion: @escaping (String?, String?) -> Void ) {
        let session = URLSession.shared
        let baseURL = "https://maps.googleapis.com/maps/api/directions/json"
        let origin = "\(source.latitude),\(source.longitude)"
        let destination = "\(destination.latitude),\(destination.longitude)"
        let apiKey =  "AIzaSyCAVIpdsLx01dL-4uBmXtzP0ruGkg78zqA"
        let urlString = "\(baseURL)?origin=\(origin)&destination=\(destination)&sensor=false&mode=driving&key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            // Handle URL creation error
            return
        }
        let task = session.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                completion(nil, "error")
                return
            }
            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!,
                                                                     options: .allowFragments) as? [String: Any] else {
                completion(nil, "error")
                print("error in JSONSerialization")
                return
            }
            guard let routes = jsonResult["routes"] as? [Any] else {
                completion(nil, "error")
                return
            }
            guard let route = routes[0] as? [String: Any] else {
                completion(nil, "error")
                return
            }
            guard let legs = route["legs"] as? [Any] else {
                completion(nil, "error")
                return
            }
            guard let leg = legs[0] as? [String: Any] else {
                completion(nil, "error")
                return
            }
            guard let steps = leg["steps"] as? [Any] else {
                completion(nil, "error")
                return
            }
            for item in steps {
                guard let step = item as? [String: Any] else {
                    completion(nil, "error")
                    return
                }
                guard let polyline = step["polyline"] as? [String: Any] else {
                    completion(nil, "error")
                    return
                }
                guard let polyLineString = polyline["points"] as? String else {
                    completion(nil, "error")
                    return
                }
                completion(polyLineString, nil)
            }
        }
        task.resume()
    }
    func reverseUpdate() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(name) { [self] placemarks, error in
            guard error == nil else { return}
            guard let placemark = placemarks?[0] else {return}
            let coord = placemark.location?.coordinate ?? CLLocationCoordinate2D(latitude:
                                                                                   CLLocationDegrees(0),
                                                                                 longitude: CLLocationDegrees(0))
            self.searchedRegion = MKCoordinateRegion(center: coord, span:
                                                        MKCoordinateSpan(latitudeDelta: 0.5,
                                                                         longitudeDelta: 0.5))
            self.location = CLLocationCoordinate2D(latitude: placemark.location?.coordinate.latitude ?? 0,
                                                   longitude: placemark.location?.coordinate.longitude ?? 0)
            annotations = [City(name: self.name, coordinate: location!)]
        }
    }
}
extension CLLocationDistance {
    func toMiles() -> CLLocationDistance {
        return self*0.00062137
    }
    func toKilometers() -> CLLocationDistance {
        return self/1000
    }
}
