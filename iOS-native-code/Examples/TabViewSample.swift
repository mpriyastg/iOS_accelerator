//
//  TabViewSample.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 06/06/23.
//

import SwiftUI

struct TabViewSample: View {
    var body: some View {
        BaseTabView(viewsArr: [BaseTabViewModel(tabName: "Profile",
                                                tabImage: Image(systemName: "person.fill"),
                                                tabView: AnyView(TabViewSampleProfileView())),
                                                BaseTabViewModel(tabName: "Chat",
                                                tabImage: Image(systemName: "message.fill"),
                                                tabView: AnyView(TabViewSampleChatView())),
                                                BaseTabViewModel(tabName: "Document",
                                                tabImage: Image(systemName: "doc.fill"),
                                                tabView: AnyView(TabViewSampleDocumentView()))])
    }
}

struct TabViewSampleProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Profile View")
                Spacer()
            }
            Spacer()
        }
        .padding(0)
        .background(Color.teal)

    }
}

struct TabViewSampleChatView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Chat View")
                Spacer()
            }
            Spacer()
        }
        .padding(0)
        .background(Color.gray)
    }
}

struct TabViewSampleDocumentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Document View")
                Spacer()
            }
            Spacer()
        }
        .padding(0)
        .background(Color.green)
    }
}

struct TabViewSample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewSample()
    }
}
extension Color {
    static let teal = Color(red: 0.0, green: 0.5, blue: 0.5)
}
