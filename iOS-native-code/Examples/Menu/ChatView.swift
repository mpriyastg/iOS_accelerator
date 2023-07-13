//
//  ChatView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 02/06/23.
//

import SwiftUI

struct ChatView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        Text("CHAT VIEW")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(presentSideMenu: .constant(false))
    }
}
