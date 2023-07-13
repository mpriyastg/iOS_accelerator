//
//  HomeView.swift
//  iOS-native-code
//
//  Created by admin on 24/05/23.
//

import SwiftUI

struct Menu: Hashable, Identifiable {
    let id = UUID()
    var name: String
}
struct HomeView: View {
    let menuArr = [
        L10n.HomeView.uiWidgets,
        L10n.HomeView.popups,
        L10n.HomeView.loader,
        L10n.HomeView.menu,
        L10n.HomeView.tabView,
        L10n.HomeView.webView,
        L10n.HomeView.share,
//        L10n.HomeView.mapView,
        L10n.HomeView.googleMap,
        L10n.HomeView.cameraGallery,
        L10n.HomeView.swiftGenJson,
        L10n.HomeView.apiView,
        L10n.HomeView.modifierView,
        L10n.HomeView.networkCheck
       ]
      var body: some View {
           if #available(iOS 16.0, *) {
               NavigationStack {
                   List(menuArr, id: \.self) { menu in
                       NavigationLink {
                           switch menu {
                           case L10n.HomeView.uiWidgets:
                               WidgetsView()
                           case L10n.HomeView.popups:
                               AlertSample()
                           case L10n.HomeView.loader:
                               LoaderSample()
                           case L10n.HomeView.menu:
                               MainTabbedView(selectedSideMenuTab: 0)
                           case L10n.HomeView.tabView:
                               TabViewSample()
                           case L10n.HomeView.webView:
                               WebViewSample()
                           case L10n.HomeView.share:
                               ShareContentExample()
//                           case L10n.HomeView.mapView:
//                               MapViewSample(locVm: LocationManager())
                           case L10n.HomeView.googleMap:
                               GoogleMapSample()
                           case L10n.HomeView.cameraGallery:
                               CameraSample()
                           case L10n.HomeView.swiftGenJson:
                               SwiftGenJsonSample()
                           case L10n.HomeView.apiView:
                               SampleAPI()
                           case L10n.HomeView.modifierView:
                               SampleModifier()
                           case L10n.HomeView.networkCheck:
                               NetworkCheckSample()
                           default:
                               WidgetsView()
                           }
                       } label: {
                           Text(menu)
                       }
                   }
                   .navigationTitle("Menu")
               }
           } else {
               // Fallback on earlier versions
           }
       }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
