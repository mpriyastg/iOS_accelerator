//
//  User.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 02/07/23.
//

import Foundation

import SwiftUI

class UserModel: ObservableObject {
  @Published var users: [User] = []
  init() {
    users.append(contentsOf: UserModel.mockData)
  }
}

class User: Decodable {
  var name: String
  var address: String
  var phone: String

  init(name: String, address: String, phone: String) {
    self.name = name
    self.address = address
    self.phone = phone
  }
}

extension User: Identifiable {
  var id: String { name }
}

extension UserModel {
  static var mockData: [User] {
    do {
      let data = try JSONSerialization.data(withJSONObject: JSONFiles.users, options: [])
      let userList = try JSONDecoder().decode([User].self, from: data)
      return userList
    } catch {
      print(error.localizedDescription)
      return []
    }
  }
}
