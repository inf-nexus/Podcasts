//
//  HomeScreen.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/8/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
            
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        
        setupViews()
    }

    func setupViews() {
        
    }

}

extension HomeController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        
        cell.backgroundColor = .red
        
        return cell
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 200
        let width = view.frame.width
        let size = CGSize(width: width, height: height)
    
        return size
    }
    
}

