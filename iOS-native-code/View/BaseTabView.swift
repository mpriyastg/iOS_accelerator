//
//  BaseTabView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 06/06/23.
//

import SwiftUI

struct BaseTabViewModel: Identifiable {
    // Tabview configuration
    let id =  UUID()
    let tabName: String?
    let tabImage: Image?
    let tabView: AnyView
}
struct BaseTabView: View {
    /// configuration for each tab should be passed as an array
    let viewsArr: [BaseTabViewModel]
    var body: some View {
        TabView {
            ForEach(viewsArr) { model in
                model.tabView
                    .tabItem {
                        if let name = model.tabName {
                            Text(name)
                        }
                        if let img = model.tabImage {
                            img
                        }
                    }
            }
        }
    }
}

struct BaseTabView_Previews: PreviewProvider {
    static var previews: some View {
        BaseTabView(viewsArr: [BaseTabViewModel(tabName: "one",
                                                tabImage: Image(systemName: "message.fill"),
                                                tabView: AnyView(Text("Hey hi"))),
                                                BaseTabViewModel(tabName: "Two",
                                                tabImage: Image(systemName: "person"),
                                                tabView: AnyView(Text("Hi")))])
    }
}
