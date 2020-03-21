//
//  PlayerViewController.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/1/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class PlayerScreen: UIView {
    
    var playerNavigationBar: PlayerNavigationBar!
    var coverImage: LoadableImage!
    var episodeDetails: EpisodeDetails!
    var scrubber: Scrubber!
    var mediaControls: MediaControls!
    
    var podcastTitle = "Serial"
    var podcastEpisodeTitle = "MISSING Crazy Crime Story"
    var podcastAuthorTitle = "Serial"
    
    init() {
        super.init(frame: .zero)
        
        layoutMargins = UIEdgeInsets(top: safeAreaInsets.top, left: 30, bottom: safeAreaInsets.bottom, right: 30)
        
        setupBackgroundColor()
        setupViews()
        setupDragGesure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundColor() {
        
        backgroundColor = .white

        let colorView = UIView()
        addSubview(colorView)
        colorView.fillSuperview()
        colorView.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        
    }
    
    private func setupViews() {
        configureViews()
        layoutViews()
    }
    
    private func configureViews() {
        
        playerNavigationBar = PlayerNavigationBar(delegate: self)
        addSubview(playerNavigationBar)
        
        coverImage = LoadableImage()
        addSubview(coverImage)
        
        episodeDetails = EpisodeDetails(episodeTitle: podcastEpisodeTitle, episodeAuthor: podcastAuthorTitle)
        addSubview(episodeDetails)
        
        scrubber = Scrubber(delegate: self)
        addSubview(scrubber)
    
        mediaControls = MediaControls(delegate: self)
        addSubview(mediaControls)
                
    }
    
    private func layoutViews() {
        
        playerNavigationBar
            .anchorTop(to: layoutMarginsGuide.topAnchor)
            .anchorWidth(to: layoutMarginsGuide.widthAnchor)
            .setHeight(50)
            .centerHorizontally()
        
        coverImage
            .anchorTop(to: playerNavigationBar.bottomAnchor, padding: 30)
            .anchorWidth(to: layoutMarginsGuide.widthAnchor)
            .anchorHeight(to: layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
        
        episodeDetails
            .anchorTop(to: coverImage.bottomAnchor, padding: 60)
            .anchorWidth(to: layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
        
        scrubber
            .anchorTop(to: episodeDetails.bottomAnchor, padding: 10)
            .anchorWidth(to: layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
                
        mediaControls
            .anchorTop(to: scrubber.bottomAnchor, padding: 20)
            .anchorHeight(to: layoutMarginsGuide.heightAnchor, scale: 0.14)
            .anchorWidth(to: layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
    }
    
    private func setupDragGesure() {
        
        let dragGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragGesture))
        
        addGestureRecognizer(dragGestureRecognizer)
        
    }
    
    @objc private func dragGesture(gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .began {
                        
        } else if gesture.state == .changed {
            
            let translation = gesture.translation(in: superview)
                        
            transform = CGAffineTransform(translationX: 0, y: translation.y)
            
        } else if gesture.state == .ended {
            
            UIView.animate(withDuration: 0.3) {
                 self.transform = .identity
            }
        }
        
    }

}

extension PlayerScreen: PlayerNavigationBarDelegate {
    func playerNavigationBar(didSelectMinimize button: UIButton) {
        print("minimize pressed")
    }
    
    func playerNavigationBar(didSelectMore button: UIButton) {
        print("more pressed")
    }
    
}

extension PlayerScreen: ScrubberDelegate {
    func scrubber(didChange value: Float) {
        print("scrubber value changed: \(value)")
    }
}

extension PlayerScreen: MediaControlsDelegate {
    func mediaControls(didPressPlay button: UIButton) {
        print("play pressed")
    }
    
    func mediaControls(didPressRewind button: UIButton) {
        print("rewind pressed")

    }
    
    func mediaControls(didPressFastForward button: UIButton) {
        print("fastforward pressed")

    }
    
}


