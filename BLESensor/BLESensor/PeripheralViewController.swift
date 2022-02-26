//
//  PeripheralViewController.swift
//  BLESensor
//
//  Created by user on 2/23/22.
//

import UIKit

class PeripheralViewController: UIViewController {

  var peripheral: BLEPeripheral!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    peripheral = BLEPeripheral(dataSource: DeviceAccelerometerDataSource())
  }
}
