//
//  AppDelegate.swift
//  TestMVP
//
//  Created by Alexander Myskin on 26.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appStartManager: AppStartManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.appStartManager = AppStartManager(window: self.window)
        self.appStartManager?.start()
        return true
    }



}

