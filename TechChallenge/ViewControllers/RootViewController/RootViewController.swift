//
//  RootViewController.swift
//  TechChallenge
//
//  Created by Emiko Clark on 8/25/19.
//  Copyright © 2019 Marcus. All rights reserved.
//

import UIKit
//
//
//func setupTabBar() {
//    // vc 1
//    let vc1 = UINavigationController(rootViewController: TransactionTableViewController())
//    vc1.tabBarItem = UITabBarItem(title: "TableView", image: nil, tag: 0)
//
//    // vc 2
//    let cv = TransactionCollectionViewController()
//    let vc2 = UINavigationController(rootViewController: cv)
//    vc2.tabBarItem = UITabBarItem(title: "CollectionView", image: nil, tag: 1)
//    viewControllers = [vc1, vc2]
//}
//=========


//class RootViewController: UITabBarController, UITabBarControllerDelegate {
//
//    private (set) var tabs = [TabItem]()
//
////    required init?(coder aDecoder: NSCoder) {
////        super.init(coder: aDecoder)
////    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        delegate = self
//        setupTabs()
//        getNavigationController()
//    }
//
//    private func setupTabs() {
//        tabBar.backgroundColor = .cyan
//    }
//
//    func getNavigationController() -> [UINavigationController] {
//        let nvc: UINavigationController
//        let rvcs: [RootViewController]
//
//        viewControllers = tabs.compactMap { tab -> UIViewController in
//
////
////            for (index,vc) in viewControllers?.enumerated() {
////                vc = UINavigationController(rootViewController: TabItem.item(for: vc))
////            }
////
////            let nvc = UINavigationController(rootViewController: vc)
//            return nvcs
//        }
//
//        return rvcs
//    }
//
//}
//
//
//
//extension RootViewController {
//
//    enum TabItem: String, CaseIterable  {
//        case tv
//        case cv
//
//        var viewController: UIViewController {
//            let vc: UIViewController
//
//            switch self {
//                case .tv:
//                    vc = TransactionTableViewController()
//                case .cv:
//                    vc = TransactionCollectionViewController()
//            }
//            return vc
//        }
//
//        var viewControllerType: UIViewController.Type {
//            switch self {
//                case .tv:
//                    return TransactionTableViewController.self
//                case .cv:
//                    return TransactionCollectionViewController.self
//            }
//        }
//
//        var image: UIImage {
//            let assetIdentifier: UIImage
//
//            switch self {
//                case .tv:
//                    assetIdentifier = UIImage(named: "tvIcon.png")!
//                case .cv:
//                    assetIdentifier = UIImage(named: "cvIcon.png")!
//            }
//            return assetIdentifier
//        }
//
//        static func item(for viewController: UIViewController) -> TabItem? {
//            if viewController.isKind(of: TabItem.tv.viewControllerType) {
//                return .tv
//            }
//            if viewController.isKind(of: TabItem.cv.viewControllerType) {
//                return .cv
//            }
//            return nil
//        }
//    }
//}
//
//enum ImageAssetIdentifier: String, CaseIterable {
//    case tvIcon
//    case cvIcon
//}
//
//enum TabItemTitle  {
//    var tabBarTitle: String {
//        switch TabItem {
//            case .tv:
//                tabBarTitle = "TableView"
//            case .cv:
//                tabBarTitle = "CollectionView"
//        }
//        return tabBarTitle
//    }
//}
