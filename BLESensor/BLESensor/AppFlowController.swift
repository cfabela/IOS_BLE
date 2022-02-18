//
//  AppFlowController.swift
//  BLESensor
//
//  Created by user on 2/17/22.
//

import UIKit

class AppFlowController {
  let window: UIWindow
  var central: BLECentral?
  
  init(window: UIWindow){
    self.window = window
  }
  
  func start(){
    central = BLECentral()
    
    let viewController = DiscoveryViewController()
    viewController.central = central
    
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
}
