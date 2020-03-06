//
//  UINavigationController.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/5/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func disableBackgroundVisibility() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true

    }
    
    func enableBackgroundVisibility() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        navigationBar.isTranslucent = false
    }
    
}
