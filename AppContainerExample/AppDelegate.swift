//
//  AppDelegate.swift
//  AppContainerExample
//
//  Created by Patrick Mick on 5/4/19.
//  Copyright © 2019 Patrick Mick. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = FlowContainerViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
