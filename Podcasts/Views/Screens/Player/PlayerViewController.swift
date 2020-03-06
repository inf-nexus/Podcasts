//
//  PlayerViewController.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/1/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var coverImage: LoadableImage!
    var episodeDetails: EpisodeDetails!
    var scrubber: Scrubber!
    var mediaControls: MediaControls!
    
    var podcastTitle = "Serial"
    var podcastEpisodeTitle = "MISSING Crazy Crime Story"
    var podcastAuthorTitle = "Serial"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.shadowImage = .none
        
        setupBackgroundColor()
        configureNavigationBar()
        setupViews()
    }
    
    
    func setupBackgroundColor() {
        
        view.backgroundColor = .white

        let colorView = UIView()
        view.addSubview(colorView)
        colorView.fillSuperview()
        colorView.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        
    }
    
    func configureNavigationBar() {
        
        navigationController?.disableBackgroundVisibility()
                
        let collapseImage = UIImage(icon: .chevronDown)
        let leftBarButtonItem = UIBarButtonItem(image: collapseImage , style: .plain, target: self, action: nil)
        leftBarButtonItem.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.title = podcastTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        let moreImage = UIImage(icon: .ellipsis)
        let rightBarButtonItem = UIBarButtonItem(image: moreImage , style: .plain, target: self, action: nil)
        rightBarButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews() {
        configureViews()
        layoutViews()
    }
    
    func configureViews() {
        
        coverImage = LoadableImage()
        view.addSubview(coverImage)
        
        episodeDetails = EpisodeDetails(episodeTitle: podcastEpisodeTitle, episodeAuthor: podcastAuthorTitle)
        view.addSubview(episodeDetails)
        
        scrubber = Scrubber()
        view.addSubview(scrubber)
    
        mediaControls = MediaControls(_playPressed: playPressed, _rewindPressed: rewindPressed, _fastForwardPressed: fastForwardPressed)
        view.addSubview(mediaControls)
                
    }
    
    func layoutViews() {
        
        coverImage
            .anchorTop(to: view.safeAreaLayoutGuide.topAnchor, padding: 50)
            .anchorWidth(to: view.layoutMarginsGuide.widthAnchor)
            .anchorHeight(to: view.layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
        
        episodeDetails
            .anchorTop(to: coverImage.bottomAnchor, padding: 60)
            .anchorWidth(to: view.layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
        
        scrubber
            .anchorTop(to: episodeDetails.bottomAnchor, padding: 10)
            .anchorWidth(to: view.layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
                
        mediaControls
            .anchorTop(to: scrubber.bottomAnchor, padding: 20)
            .anchorHeight(to: view.layoutMarginsGuide.heightAnchor, scale: 0.14)
            .anchorWidth(to: view.layoutMarginsGuide.widthAnchor)
            .centerHorizontally()
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
