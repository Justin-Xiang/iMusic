//
//  ViewController.swift
//  iMusic
//
//  Created by JustinXiang on 2021/01/17.
//  Copyright © 2021 JustinXiang. All rights reserved.
//

import UIKit

let libraryRootViewController = LibraryRootViewController()

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = true
        self.tabBar.alpha = 0.8
        self.tabBar.tintColor = .red
        setUpVC()
        self.selectedIndex = 0
        
    }
    
    fileprivate func setUpVC(){
        let libraryViewController = LibraryViewController(rootViewController: libraryRootViewController)
        let forYouViewController = ForYouViewController()
        let browseViewController = BrowseViewController()
        let radioViewController = RadioViewController()
        let searchViewController = SearchViewController()
        
        libraryViewController.tabBarItem.title = "资料库"
        forYouViewController.tabBarItem.title = "为你推荐"
        browseViewController.tabBarItem.title = "浏览"
        radioViewController.tabBarItem.title = "广播"
        searchViewController.tabBarItem.title = "搜索"
                
        self.viewControllers = [libraryViewController, forYouViewController, browseViewController, radioViewController, searchViewController]
        
    }
    
    
}
