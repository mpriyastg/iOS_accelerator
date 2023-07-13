//
//  Optional+Extensions.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 12/06/23.
//

import Foundation

public extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }

    var orEmptyValue: String {
        self ?? Constants.Defaults.emptyValue
    }
}

public extension Optional where Wrapped == Int {
    var orZero: Int {
        self ?? 0
    }
}

public extension Optional where Wrapped == Double {
    var orZero: Double {
        self ?? 0
    }
}
