//
//  EpisodeDetail.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/5/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class EpisodeDetails: UIView {
    
    var episodeTitleLabel: UILabel!
    var episodeAuthorLabel: UILabel!
    
    var episodeTitle: String?
    var episodeAuthor: String?
    
    init(episodeTitle: String, episodeAuthor: String) {
        super.init(frame: .zero)
                
        self.episodeTitle = episodeTitle
        self.episodeAuthor = episodeAuthor
        
        setupViews()
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        configureViews()
        layoutViews()
    }
    
    func configureViews() {
        episodeTitleLabel = UILabel()
        episodeTitleLabel.text = episodeTitle
        episodeTitleLabel.textColor = .white
        episodeTitleLabel.font = .systemFont(ofSize: 35)
        addSubview(episodeTitleLabel)
        
        episodeAuthorLabel = UILabel()
        episodeAuthorLabel.text = episodeAuthor
        episodeAuthorLabel.textColor = UIColor.white.withAlphaComponent(0.85)
        episodeAuthorLabel.font = .systemFont(ofSize: 20)
        addSubview(episodeAuthorLabel)
    }
    
    func layoutViews() {
        
        episodeTitleLabel
            .anchorTop(to: topAnchor)
            .anchorWidth(to: widthAnchor)
        
        episodeAuthorLabel
            .anchorTop(to: episodeTitleLabel.bottomAnchor)
            .anchorWidth(to: widthAnchor)

        
        anchorBottom(to: episodeAuthorLabel.bottomAnchor)
        
    }
    
}
