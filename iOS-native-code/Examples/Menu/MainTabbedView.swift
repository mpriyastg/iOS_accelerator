//
//  MainTabbedView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 02/06/23.
//

import SwiftUI

struct MainTabbedView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                ProfileView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                ChatView(presentSideMenu: $presentSideMenu)
                    .tag(0)
            }
         MenuView(isShowing: $presentSideMenu,
                  content: AnyView(MenuSampleView(selectedSideMenuTab: $selectedSideMenuTab,
                                                  presentSideMenu: $presentSideMenu)))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: menuAction) {
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
    }
    func menuAction() {
        presentSideMenu = true
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
    }
}
