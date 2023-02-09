//
//  AppDelegate.swift
//  WineShop
//
//  Created by Kostyan on 10.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: AuthModuleBuilder.build())
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
        
        return true
    }



}

