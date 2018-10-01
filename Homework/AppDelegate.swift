//
//  AppDelegate.swift
//  Homework
//
//  Created by Ivan Babich on 23.09.2018.
//  Copyright © 2018 Ivan Babich. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var lastApplicationState = UIApplication.State(rawValue: 1)!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

}
