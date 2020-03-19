//
//  PlayerViewController.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/1/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class PlayerScreen: UIView {
    
    var coverImage: LoadableImage!
    var episodeDetails: EpisodeDetails!
    var scrubber: Scrubber!
    var mediaControls: MediaControls!
    
    var podcastTitle = "Serial"
    var podcastEpisodeTitle = "MISSING Crazy Crime Story"
    var podcastAuthorTitle = "Serial"
    
    init() {
        super.init(frame: .zero)
        
        setupBackgroundColor()
        configureNavigationBar()
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
    
    private func configureNavigationBar() {
        
//        navigationController?.disableBackgroundVisibility()
                
        let collapseImage = UIImage(icon: .chevronDown)
        let leftBarButtonItem = UIBarButtonItem(image: collapseImage , style: .plain, target: self, action: nil)
        leftBarButtonItem.tintColor = .white
//        navigationItem.leftBarButtonItem = leftBarButtonItem
//
//        navigationItem.title = podcastTitle
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        let moreImage = UIImage(icon: .ellipsis)
        let rightBarButtonItem = UIBarButtonItem(image: moreImage , style: .plain, target: self, action: nil)
        rightBarButtonItem.tintColor = .white
//        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func setupViews() {
        configureViews()
        layoutViews()
    }
    
    private func configureViews() {
        
        coverImage = LoadableImage()
        addSubview(coverImage)
        
        episodeDetails = EpisodeDetails(episodeTitle: podcastEpisodeTitle, episodeAuthor: podcastAuthorTitle)
        addSubview(episodeDetails)
        
        scrubber = Scrubber()
        addSubview(scrubber)
    
        mediaControls = MediaControls(_playPressed: playPressed, _rewindPressed: rewindPressed, _fastForwardPressed: fastForwardPressed)
        addSubview(mediaControls)
                
    }
    
    private func layoutViews() {
        
        coverImage
            .anchorTop(to: safeAreaLayoutGuide.topAnchor, padding: 50)
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
    
    func playPressed(_ sender: UIButton) {
        print("play pressed!")
    }
    
    func rewindPressed(_ sender: UIButton) {
        print("rewind pressed!")
    }
    
    func fastForwardPressed(_ sender: UIButton) {
        print("fast forward pressed!")
    }

}