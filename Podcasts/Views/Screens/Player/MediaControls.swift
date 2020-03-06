//
//  PlayerControls.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/1/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class MediaControls: UIView {
    
    var containerView: UIStackView!
    var playButton: UIButton!
    var rewind15Button: UIButton!
    var fastForward15Button: UIButton!
    
    var _playPressed: ((UIButton) -> Void)?
    var _rewindPressed: ((UIButton) -> Void)?
    var _fastForwardPressed: ((UIButton) -> Void)?

    init(_playPressed: @escaping (UIButton) -> Void,
         _rewindPressed: @escaping (UIButton) -> Void,
         _fastForwardPressed: @escaping (UIButton) -> Void) {
        
        super.init(frame: .zero)
        self._playPressed = _playPressed
        self._rewindPressed = _rewindPressed
        self._fastForwardPressed = _fastForwardPressed
                
        setupContainerView()
        setupArrangedSubViews()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContainerView() {
        configureContainerView()
        layoutContainerView()
    }
    
    func configureContainerView() {
        containerView = UIStackView()
        containerView.axis = .horizontal
        containerView.alignment = .center
        containerView.distribution = .equalSpacing
        addSubview(containerView)
    }
    
    func layoutContainerView() {
        containerView.fillSuperview()
    }
    
    func setupArrangedSubViews() {
        configureArrangedSubViews()
        layoutArrangedSubViews()
    }
    
    func configureArrangedSubViews() {
                
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
        
        let leftSpacer = UIView()
        let rightSpacer = UIView()

        [leftSpacer, rewind15Button, playButton, fastForward15Button, rightSpacer].forEach({
            containerView.addArrangedSubview($0)
        })
        
    }
    
    func layoutArrangedSubViews() {
        
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
        _playPressed?(sender)
    }
    
    @objc func rewindPressed(_ sender: UIButton) {
        _rewindPressed?(sender)
    }
    
    @objc func fastForwardPressed(_ sender: UIButton) {
        _fastForwardPressed?(sender)
    }
    
}
