//
//  TabBarController.swift
//  Podcasts
//
//  Created by Jacob Contreras on 3/18/20.
//  Copyright © 2020 Jacob Contreras. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupTabBar()
        setupPlayerScreen()
        
    }

    private func setupTabBar() {
        
        let layout = UICollectionViewFlowLayout()
        let homeVC = HomeController(collectionViewLayout: layout)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(icon: .house), tag: 0)
        
        let searchVC =  SearchController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(icon: .magnifyingglass), tag: 1)
        
        let downloadsVC = DownloadsController()
        downloadsVC.tabBarItem = UITabBarItem(title: "Downloads", image: UIImage(icon: .arrowDownToLineAlt), tag: 2)
        
        viewControllers = [homeVC, searchVC, downloadsVC]
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
        
    }
    
    private func setupPlayerScreen() {
        
        let playerScreen = PlayerScreen()
        view.insertSubview(playerScreen, belowSubview: tabBar)
        
        playerScreen.fillSuperview()
        
    }
}
