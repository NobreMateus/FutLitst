//
//  ViewController.swift
//  FutList
//
//  Created by Mateus Nobre on 13/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.tabBar.barTintColor = .black
        tabBar.tintColor = UIColor(red: 175/255, green: 82/255, blue: 222/255, alpha: 1)
        let seguindoViewController = UINavigationController(rootViewController: LiveMatchesViewController()) 
        let jogosViewController =  UINavigationController(rootViewController: JogosViewController())
        let descobrirViewController = DescobrirViewController()

        seguindoViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        jogosViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        descobrirViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        viewControllers = [seguindoViewController, jogosViewController, descobrirViewController]
    }
}
