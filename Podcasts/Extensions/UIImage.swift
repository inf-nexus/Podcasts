//
//  UIImage.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/5/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

extension UIImage {
    
    enum imageIcon: String {
        case playCircleFill = "play.circle.fill"
        case gobackward15 = "gobackward.15"
        case goforward15 = "goforward.15"
        case chevronDown = "chevron.down"
        case ellipsis = "ellipsis"
        
    }
    
    convenience init?(icon: imageIcon) {
        self.init(systemName: icon.rawValue)
    }
    
}
