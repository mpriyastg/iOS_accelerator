//
//  SwiftUIView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 02/07/23.
//

import SwiftUI

struct SwiftGenJsonSample: View {
    @StateObject var userList = UserModel()

    var body: some View {

        List {
            ForEach(Array(0..<userList.users.count), id: \.self) { index in
                HStack {
                    Text(userList.users[index].name)
                    Spacer()
                    Text(userList.users[index].phone)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(userList.users[index].address)
                }
            }
        }
    }
}
