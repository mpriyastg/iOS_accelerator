//
//  UIView+AutoLayoutConstraints.swift
//  iOS-native-code
//
//  Created by admin on 03/04/23.
//

import UIKit

enum AutoLayoutDirection {
    case top
    case left
    case bottom
    case right
}

extension UIView {
    func addAnchors(toEdges edges: [AutoLayoutDirection], inView otherView: UIView, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        for edge in edges {
            switch edge {
            case .top:
                self.topAnchor.constraint(equalTo: otherView.topAnchor, constant: constant).isActive = true
            case .left:
                self.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: constant).isActive = true
            case .bottom:
                self.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: -constant).isActive = true
            case .right:
                self.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -constant).isActive = true
            }
        }
    }
    func center(inView otherView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerHorizontally(inView: otherView)
        self.centerVertically(inView: otherView)
    }

    func centerHorizontally(inView otherView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: otherView.centerXAnchor).isActive = true
    }

    func centerVertically(inView otherView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: otherView.centerYAnchor).isActive = true
    }
    func setWidthAnchor(equalToConstant constant: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    func setHeightAnchor(equalToConstant constant: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    func setWidthAnchor(equalToView otherView: UIView, multiplier: CGFloat = 1.0) {
        self.widthAnchor.constraint(equalTo: otherView.widthAnchor, multiplier: multiplier).isActive = true
    }
    func setHeightAnchor(equalToView otherView: UIView, multiplier: CGFloat = 1.0) {
        self.heightAnchor.constraint(equalTo: otherView.widthAnchor, multiplier: multiplier).isActive = true
    }
    func buildContainer(verticalSpacing: CGFloat = 0,
                        horizontalSpacing: CGFloat = 0) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: container.topAnchor, constant: verticalSpacing),
            self.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: horizontalSpacing),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: horizontalSpacing),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: verticalSpacing)
        ])
     return container
    }
}
