//
//  MapViewSample.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 08/06/23.
//

import SwiftUI
import MapKit
import Combine

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

@available(iOS 15.0, *)
struct MapViewSample: View {

    @ObservedObject var locVm: LocationManager
    @Environment(\.dismiss) var dismiss

    var body: some View {

        ZStack {
            if locVm.searchedRegion != nil {
                let reg = $locVm.searchedRegion
                Map(coordinateRegion: Binding(reg)!,
                    interactionModes: .all,
                    showsUserLocation: true,
                    annotationItems: locVm.annotations) { ann in
                    MapMarker(coordinate: ann.coordinate)
                }
            } else {
                Map(coordinateRegion: $locVm.region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    annotationItems: locVm.annotations) { ann in
                    MapMarker(coordinate: ann.coordinate)
                }
            }
            VStack {
                SearchCompleter(locVM: LocationManager())
                Spacer()
                    .background(.clear)
            }
        }
    }
}

@available(iOS 15.0, *)
struct SearchCompleter: View {
    @ObservedObject var locVM: LocationManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
            VStack {
                TextField("Search..", text: $locVM.search)
                    .textFieldStyle(.roundedBorder)
                if !locVM.searchResults.isEmpty {
                    List(locVM.searchResults, id: \.self) {res in
                        VStack(alignment: .leading, spacing: 0) {
                            SearchCompleterLabelView(searchResult: res, locVM: locVM)
                        }
                        .onTapGesture {
                            locVM.name = res.title
                            locVM.reverseUpdate()
                            locVM.searchResults.removeAll()
                        }
                    }
                }
                Spacer()
                    .background(.clear)
            }.padding()
        }
}

struct SearchCompleterLabelView: View {
    @State private var distance: String?
    let searchResult: MKLocalSearchCompletion
    @ObservedObject var locVM: LocationManager

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "pin")
                VStack(alignment: .leading, spacing: 10) {
                    Text(searchResult.title)
                    Text(searchResult.subtitle)
                    if let distance = distance {
                        Text(distance)
                    }
                }

            }

        }

    }
}

@available(iOS 15.0, *)
struct MapViewSample_Previews: PreviewProvider {
    static var previews: some View {
        MapViewSample(locVm: LocationManager())
    }
}
