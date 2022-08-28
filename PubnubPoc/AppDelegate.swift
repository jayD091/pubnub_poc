//
//  AppDelegate.swift
//  PubnubPoc
//
//  Created by Theonetech on 28/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        PubNubManager.pubNubLogLevel()
        
        return true
    }

}

