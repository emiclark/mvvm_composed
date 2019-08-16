//
//  TabBarController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    func setupTabBar() {
        // vc 1
        let vc1 = UINavigationController(rootViewController: TableViewController())
        vc1.tabBarItem = UITabBarItem(title: "TableView 1", image: nil, tag: 0)

        // vc 2
        let vc2 = UINavigationController(rootViewController: CollectionViewController())
        vc2.tabBarItem = UITabBarItem(title: "CollectionView", image: nil, tag: 1)
        viewControllers = [vc1, vc2]
    }
}
