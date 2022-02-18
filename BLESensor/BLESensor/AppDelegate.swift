//
//  AppDelegate.swift
//  BLESensor
//
//  Created by user on 2/17/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var flowController: AppFlowController?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    window = UIWindow(frame: UIScreen.main.bounds)
    flowController = AppFlowController(window: window!)
    flowController?.start()
    
    return true
  }
}
