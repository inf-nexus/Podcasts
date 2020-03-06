//
//  LoadableImage.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/5/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class LoadableImage: UIView {
    
    var imageView: UIImageView!
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    init() {
        super.init(frame: .zero)
                
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        configureView()
        layoutView()
    }
    
    func configureView() {
        
        imageView = UIImageView()
        image = UIImage(named: "serial-itunes-logo")
        
        addSubview(imageView)
        
    }
    
    func layoutView() {
        
        imageView
            .fillSuperview()
                
    }
    
}
