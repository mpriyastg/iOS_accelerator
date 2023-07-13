//
//  ProfileView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 02/06/23.
//

import SwiftUI

struct ProfileView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        Text("PROFILE VIEW")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentSideMenu: .constant(false))
    }
}
