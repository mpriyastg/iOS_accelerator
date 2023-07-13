//
//  Double+Extensions.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 12/06/23.
//

import Foundation

extension Double {

    func toRadians() -> Double {
        return self * Double.pi / 180
    }

    func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }

}
