//
//  TabBarController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/16/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    func setupTabBar() {
        // tab 1
        let tab1 = UINavigationController(rootViewController: FeedViewController())
        tab1.tabBarItem = UITabBarItem(title: "tabBarTitle_ComposedCV".localized(), image: nil, tag: 0)

        // tab 2
        let tab2 = UINavigationController(rootViewController: TransactionTableViewController())
        tab2.tabBarItem = UITabBarItem(title: "tabBarTitle_TableView".localized(), image: nil, tag: 1)

        // tab 3
        let tab3 = UINavigationController(rootViewController: TransactionCollectionViewController())
        tab3.tabBarItem = UITabBarItem(title: "tabBarTitle_CollectionView".localized(), image: nil, tag: 2)

        viewControllers = [tab1, tab2, tab3]
    }
}


//===
//final class TabBarController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTabBar()
//    }
//
//    func setupTabBar() {
//
//        // tab 1
//        let tab1 = UINavigationController(rootViewController: FeedViewController())
//        tab1.tabBarItem = UITabBarItem(title: "tabBarTitle_ComposedCV".localized(), image: nil, tag: 0)
//
//        // tab 2
//        let tab2 = UINavigationController(rootViewController: TransactionTableViewController())
//        tab2.tabBarItem = UITabBarItem(title: "tabBarTitle_TableView".localized(), image: nil, tag: 1)
//
//        // tab 3
//        let tab3 = UINavigationController(rootViewController: TransactionCollectionViewController())
//        tab3.tabBarItem = UITabBarItem(title: "tabBarTitle_CollectionView".localized(), image: nil, tag: 2)
//
//        viewControllers = [tab1, tab2, tab3]
//    }
//}

