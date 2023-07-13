//
//  ShowingModalable.swift
//  iOS-native-code
//
//  Created by admin on 27/03/23.
//

import UIKit

public protocol ShowingModalable {
    static func showModal()
    static func hideModal()
    static func showDarkModal()
}

extension ShowingModalable {
    static func isShowing(_ tag: Int) -> Bool {
        guard let rootViewController = getRootViewController(),
              rootViewController.view.viewWithTag(tag) == nil
        else {
            return true
        }
        return false
    }

    static func addToRootViewController(viewController: UIViewController, tag: Int) {
        guard let rootViewController = getRootViewController(),
              rootViewController.view.viewWithTag(tag) == nil
        else {
            return
        }

        viewController.view.tag = tag
        rootViewController.addChild(viewController)
        viewController.view.frame = UIScreen.main.bounds
        rootViewController.view.addSubview(viewController.view)
        viewController.didMove(toParent: rootViewController)
    }

    static func getRootViewController() -> UIViewController? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.window?.rootViewController
    }

    static func removeViewController(_ viewController: UIViewController?) {
        viewController?.view.removeFromSuperview()
        viewController?.removeFromParent()
    }

    static func showDarkModal() {}
}
