//
//  AppDelegate.swift
//  TechChallenge
//
//  Created by Zeeshan Mian on 4/24/18.
//  Copyright © 2018 Marcus. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        let tabBarVC = TabBarController()
        tabBarVC.selectedIndex = 0
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()

        return true
    }
}
