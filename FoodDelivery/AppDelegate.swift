//
//  AppDelegate.swift
//  FoodDelivery
//
//  Created by Alex Shtandaruk on 19.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window =  UIWindow(frame: UIScreen.main.bounds)
        
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }


}

