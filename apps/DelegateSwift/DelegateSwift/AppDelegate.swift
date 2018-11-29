//
//  AppDelegate.swift
//  DelegateSwift
//
//  Created by Janusz Chudzynski on 11/26/18.
//  Copyright © 2018 Janusz Chudzynski. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TapProtocol{
    func buttonTapped() {
        print("Button Tapped")
    }
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let w =  self.window,let vc = w.rootViewController as? ViewController
        {
            vc.delegate = self
        }
        return true
    }
}
