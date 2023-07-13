//
//  PlacesManager.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 27/06/23.
//

import Foundation
import GooglePlaces

class PlacesManager: NSObject, ObservableObject {
    private var placesClient = GMSPlacesClient.shared()
    @Published var places = [GMSPlaceLikelihood]()
    override init() {
        super.init()
        currentPlacesList { places in
            guard let plac = places else {
                return
            }
            self.places = plac
        }
}

    func currentPlacesList(completion: @escaping (([GMSPlaceLikelihood]?) -> Void)) {
        placesClient.currentPlace { (placeLikelihoodList, error) in
            if let error = error {
                print("Places failed to initialize with error \(error)")
                completion(nil)
                return
            }

            guard let placeLikelihoodList = placeLikelihoodList else {
                return
            }
            print(placeLikelihoodList.likelihoods)
            completion(placeLikelihoodList.likelihoods)

        }
    }

}
