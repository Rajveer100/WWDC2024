//
//  UINavigationController.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 13/02/24.
//

import Foundation
import UIKit

// Enables swipe gesture functionality to go back to previous view
// which is lost when disabling NavigationBar back button.
extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
