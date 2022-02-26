//
//  AppFlowController.swift
//  BLESensor
//
//  Created by user on 2/17/22.
//

import UIKit

class AppFlowController {
  let window: UIWindow
  
  init(window: UIWindow){
    self.window = window
  }
  
  func start(){
    print("start")
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BLERoleSelectViewController") as! BLERoleSelectViewController
    
    viewController.onChoice = {[weak self] choice in
      let nextViewController: UIViewController
      switch choice {
      case .central:
        let viewController = DiscoveryViewController()
        nextViewController = viewController
      case .peripheral:
        nextViewController = PeripheralViewController()
      }
      self?.window.rootViewController = nextViewController
    }
    
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
}
