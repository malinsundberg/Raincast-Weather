//
//  AppDelegate.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2018-12-25.
//  Copyright © 2018 Malin Sundberg. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithOpaqueBackground()
        scrollEdgeAppearance.backgroundColor = UIColor(named: "NavigationBarColor")
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).standardAppearance = scrollEdgeAppearance
        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).scrollEdgeAppearance = scrollEdgeAppearance
        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).compactAppearance = scrollEdgeAppearance
        
        return true
    }
}

