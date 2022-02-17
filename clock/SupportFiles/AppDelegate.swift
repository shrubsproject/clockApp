//
//  AppDelegate.swift
//  clock
//
//  Created by Ilya Egorov on 05.02.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ClockViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
