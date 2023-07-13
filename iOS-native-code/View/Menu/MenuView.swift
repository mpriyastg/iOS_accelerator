//
//  MenuView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 01/06/23.
//

import SwiftUI

struct MenuView: View {

    @Binding var isShowing: Bool
        var content: AnyView
        var edgeTransition: AnyTransition = .move(edge: .leading)
        var body: some View {
            ZStack(alignment: .bottom) {
                if isShowing {
                    Asset.Assets.black.color
                        .opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isShowing.toggle()
                        }
                    content
                        .transition(edgeTransition)
                        .background(
                            Color.clear
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .animation(.easeInOut, value: isShowing)
        }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isShowing: .constant(false), content: AnyView(ProfileView(presentSideMenu: .constant(false))))
    }
}
enum SideMenuRowType: Int, CaseIterable {
    case chat = 0
    case profile

    var title: String {
        switch self {
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }

    var iconName: String {
        switch self {
        case .chat:
            return "message.fill"
        case .profile:
            return "person.fill"
        }
    }
}
