//
//  UIView+UIViewController.swift
//  iOS-native-code
//
//  Created by admin on 03/04/23.
//

import UIKit

extension UIView {

    func viewController() -> UIViewController? {

        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.viewController()
        }

        return nil
    }
}
