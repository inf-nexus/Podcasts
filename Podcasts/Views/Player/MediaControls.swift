//
//  PlayerControls.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/1/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

protocol MediaControlsDelegate {
    
    func mediaControls(didPressPlay button: UIButton)
    func mediaControls(didPressRewind button: UIButton)
    func mediaControls(didPressFastForward button: UIButton)
    
}

class MediaControls: UIView {
    
    var containerView: UIStackView!
    var playButton: UIButton!
    var rewind15Button: UIButton!
    var fastForward15Button: UIButton!
    
    var delegate: MediaControlsDelegate!

    init(delegate: MediaControlsDelegate) {
        
        super.init(frame: .zero)
        
        self.delegate = delegate
                
        configureContainerView()
        layoutContainerView()
        
        configureArrangedSubViews()
        layoutArrangedSubViews()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContainerView() {
        containerView = UIStackView()
        containerView.axis = .horizontal
        containerView.alignment = .center
        containerView.distribution = .equalSpacing
        addSubview(containerView)
    }
    
    private func layoutContainerView() {
        let horizontalPadding: CGFloat = 40
        containerView
        .fillSuperview(paddingLeft: horizontalPadding, paddingRight: horizontalPadding)
        .centerHorizontally()
    }
    
    private func configureArrangedSubViews() {
                
        rewind15Button = UIButton()
        rewind15Button.setImageIcon(icon: .gobackward15)
        rewind15Button.tintColor = UIColor.white.withAlphaComponent(0.85)
        rewind15Button.scaleToFill()
        rewind15Button.addTarget(self, action: #selector(rewindPressed), for: .touchUpInside)
        
        playButton = UIButton()
        playButton.setImageIcon(icon: .playCircleFill)
        playButton.tintColor = .white
        playButton.scaleToFill()
        playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
        
        fastForward15Button = UIButton()
        fastForward15Button.setImageIcon(icon: .goforward15)
        fastForward15Button.tintColor = UIColor.white.withAlphaComponent(0.85)
        fastForward15Button.scaleToFill()
        fastForward15Button.addTarget(self, action: #selector(fastForwardPressed), for: .touchUpInside)

        [rewind15Button, playButton, fastForward15Button].forEach({
            containerView.addArrangedSubview($0)
        })
        
    }
    
    private func layoutArrangedSubViews() {
        
        rewind15Button
            .anchorHeight(to: heightAnchor, scale: 0.3)
            .anchorWidth(to: rewind15Button.heightAnchor)

        playButton
            .anchorHeight(to: heightAnchor, scale: 0.85)
            .anchorWidth(to: playButton.heightAnchor)

        fastForward15Button
            .anchorHeight(to: heightAnchor, scale: 0.3)
            .anchorWidth(to: fastForward15Button.heightAnchor)
    }
    
    @objc func playPressed(_ sender: UIButton) {
        delegate.mediaControls(didPressPlay: sender)
    }
    
    @objc func rewindPressed(_ sender: UIButton) {
        delegate.mediaControls(didPressRewind: sender)
    }
    
    @objc func fastForwardPressed(_ sender: UIButton) {
        delegate.mediaControls(didPressFastForward: sender)
    }
    
}
