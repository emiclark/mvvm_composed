//
//  RootViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 9/23/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import Xcore

final class RootViewController : XCTabBarController {

    let allTabs: [UITabBarController.TabItem] = [
        tab1,
        tab2,
        tab3
    ]

    static var tab1: UITabBarController.TabItem {
        return .init(id: "tab1",
                    image: "placeholder.pdf",
                    accessibilityLabel: "tabBarTitle_ComposedCV".localized(),
                    viewControllerType: FeedViewController.self,
                    viewController: FeedViewController())
    }

    static var tab2: UITabBarController.TabItem {
        return .init(id: "tab2",
                     image: "placeholder.pdf",
                     accessibilityLabel: "tabBarTitle_CollectionView".localized(),
                     viewControllerType: TransactionCollectionViewController.self,
                     viewController: TransactionTableViewController())
    }

    static var tab3: UITabBarController.TabItem {
        return .init(id: "tab3",
                     image: "placeholder.pdf",
                     accessibilityLabel: "tabBarTitle_TableView".localized(),
                     viewControllerType: TransactionTableViewController.self,
                     viewController: TransactionTableViewController())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TabItem.allCases = allTabs
        reloadTabs(TabItem.allCases)
        tabBar.isTransparent = true
        tabBar.backgroundColor = .white
    }
}


