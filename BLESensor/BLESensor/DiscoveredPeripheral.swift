//
//  DiscoveredPeripheral.swift
//  BLESensor
//
//  Created by user on 2/17/22.
//

import Foundation
import CoreBluetooth

class DiscoveredPeripheral {
  var peripheral: CBPeripheral
  var rssi: NSNumber
  var advertisementData: [String: Any]
  
  init(peripheral: CBPeripheral, rssi: NSNumber, advertisementData: [String: Any]){
    self.peripheral = peripheral
    self.rssi = rssi
    self.advertisementData = advertisementData
  }
}
