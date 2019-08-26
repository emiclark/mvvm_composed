//
//  AppDelegate.swift
//  TechChallenge V2
//
//  Created by Zeeshan Mian on 4/24/18.
//  Copyright © 2018 Marcus. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarVC = TabBarController()
        tabBarVC.selectedIndex = 2
        window?.rootViewController = tabBarVC
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], for: .normal)
        UINavigationBar.appearance().barTintColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}
