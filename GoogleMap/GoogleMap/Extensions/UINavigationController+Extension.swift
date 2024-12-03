//
//  UINavigationController+Extension.swift
//  E-Price
//
//  Created by Vishnu's Playstation on 13/03/24.
//

import UIKit
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {

    /// Called after the view controller has loaded its view into memory.
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}


