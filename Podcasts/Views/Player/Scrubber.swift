//
//  Scrubber.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/5/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

protocol ScrubberDelegate {
    
    func scrubber(didChange value: Float)
    
}

class Scrubber: UIView {
    
    var delegate: ScrubberDelegate!
    
    var slider: UISlider!
    var timeContainer: UIView!
    var currentTimeLabel: ScrubberLabel!
    var remainingTimeLabel: ScrubberLabel!
    
    var currentTime: Int = 0
    var remainingTime: Int = 0

    init(delegate: ScrubberDelegate) {
        super.init(frame: .zero)
        
        self.delegate = delegate
                
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
        
        slider = UISlider()
        slider.tintColor = .white
        slider.addTarget(self, action: #selector(handleScrubberChange), for: .valueChanged)
        addSubview(slider)
        
        currentTimeLabel = ScrubberLabel()
        currentTimeLabel.text = "00:00"
        
        remainingTimeLabel = ScrubberLabel()
        remainingTimeLabel.text = "00:00"
        
        timeContainer = UIView()
        timeContainer.addSubview(currentTimeLabel)
        timeContainer.addSubview(remainingTimeLabel)
        addSubview(timeContainer)
    }
    
    func layoutViews() {
        
        slider
            .anchorTop(to: topAnchor)
            .anchorWidth(to: widthAnchor)
        
        currentTimeLabel
            .anchorLeading(to: timeContainer.leadingAnchor)
        
        remainingTimeLabel
            .anchorTrailing(to: timeContainer.trailingAnchor)
        
        timeContainer
            .anchorTop(to: slider.bottomAnchor)
            .anchorWidth(to: widthAnchor)


        anchorBottom(to: timeContainer.bottomAnchor)
        
    }
    
    @objc func handleScrubberChange(slider: UISlider) {
        
        let value = slider.value
        delegate.scrubber(didChange: value)
    }
    
}

class ScrubberLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        textColor = UIColor.white.withAlphaComponent(0.85)
        font = .systemFont(ofSize: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
