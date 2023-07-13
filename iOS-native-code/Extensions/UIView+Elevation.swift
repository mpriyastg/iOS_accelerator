//
//  UIView+Elevation.swift
//  iOS-native-code
//
//  Created by admin on 03/04/23.
//

import Foundation
import UIKit

extension UIView {

    public func addElevation2Shadow() {
        self.layer.shadowColor = UIColor.black.cgColor.copy(alpha: 0.24)
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 6 / UIScreen.main.scale
        self.layer.masksToBounds = false
    }

    func addShadow(color: UIColor, offset: CGSize, opacity: Float = 0.24, radius: CGFloat = 6) {

        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
    }

    func removeShadow() {

        self.layer.shadowOpacity = 0
        self.layer.shadowRadius = 0
    }
}
