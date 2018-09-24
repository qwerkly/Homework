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
    var lastApplicationState = UIApplicationState(rawValue: 1)!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("Application moved from <\(lastApplicationState.state())> to <\(UIApplication.shared.applicationState.state())>: <\(#function)>")
        lastApplicationState = UIApplication.shared.applicationState
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Application moved from <\(lastApplicationState.state())> to <\(UIApplication.shared.applicationState.state())>: <\(#function)>")
        lastApplicationState = UIApplication.shared.applicationState
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Application moved from <\(lastApplicationState.state())> to <\(UIApplication.shared.applicationState.state())>: <\(#function)>")
        lastApplicationState = UIApplication.shared.applicationState
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Application moved from <\(lastApplicationState.state())> to <\(UIApplication.shared.applicationState.state())>: <\(#function)>")
        lastApplicationState = UIApplication.shared.applicationState
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Application moved from <\(lastApplicationState.state())> to <\(UIApplication.shared.applicationState.state())>: <\(#function)>")
        lastApplicationState = UIApplication.shared.applicationState
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Application moved from <\(lastApplicationState.state())> to <\(UIApplication.shared.applicationState.state())>: <\(#function)>")
        lastApplicationState = UIApplication.shared.applicationState
    }

}

extension UIApplicationState {
    
    /// Возвращает строку состояния приложения.
    ///
    /// - Returns: Строка состояния приложения
    func state() -> String {
        switch self {
        case .active:
            return "active"
        case .inactive:
            return "inactive"
        case .background:
            return "background"
        }
    }
}
