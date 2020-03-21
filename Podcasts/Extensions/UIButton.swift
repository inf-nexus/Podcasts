//
//  UIButton.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/4/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

extension UIButton {
        
    func scaleToFill() {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        imageView?.contentMode = .scaleAspectFill
    }
    
    func scaleToFit() {
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
        imageView?.contentMode = .scaleAspectFit
    }
    
    func setImageIcon(icon: UIImage.imageIcon, for controlState: UIControl.State = .normal) {
        setImage(UIImage(icon: icon), for: controlState)
    }

}
