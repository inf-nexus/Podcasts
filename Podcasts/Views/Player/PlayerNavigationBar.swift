//
//  NavigationBar.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/19/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class PlayerNavigationBar: UIView {
    
    private var containerView: UIStackView!
    private var minimizeButton: UIButton!
    private var playerTitleLabel: UILabel!
    private var moreButton: UIButton!
    
    var playerTitle = "Serial"
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureContainerView()
        layoutContainerView()
        configureNavigationContent()
        layoutNavigationContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContainerView() {
        containerView = UIStackView()
        containerView.distribution = .equalCentering
        containerView.alignment = .center
        addSubview(containerView)
    }
    
    private func layoutContainerView() {
        containerView.fillSuperview()
    }
    
    private func configureNavigationContent() {
     
        minimizeButton = UIButton()
        minimizeButton.setImageIcon(icon: .chevronDown)
        minimizeButton.scaleToFit()
        minimizeButton.tintColor = .white
        
        playerTitleLabel = UILabel()
        playerTitleLabel.text = playerTitle
        playerTitleLabel.textColor = .white
        
        moreButton = UIButton()
        moreButton.setImageIcon(icon: .ellipsis)
        moreButton.scaleToFit()
        moreButton.tintColor = .white
        
        [minimizeButton, playerTitleLabel, moreButton].forEach({
            containerView.addArrangedSubview($0)
        })
        
    }
    
    private func layoutNavigationContent() {
        
        [minimizeButton, moreButton].forEach({ button in
            guard let button = button else { return }
            button
                .anchorWidth(to: widthAnchor, scale: 0.06)
                .anchorHeight(to: button.widthAnchor)
            
            button.imageView?
                .anchorWidth(to: button.widthAnchor)
                .anchorHeight(to: button.heightAnchor)
        })

    }
    
}
