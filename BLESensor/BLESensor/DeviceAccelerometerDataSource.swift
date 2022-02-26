//
//  DeviceAccelerometerDataSource.swift
//  BLESensor
//
//  Created by user on 2/25/22.
//

import Foundation
import CoreMotion

class DeviceAccelerometerDataSource: AccelerometerDataSource {
  
  var onUpdate: ((AccelerometerData) -> Void)?
  
  private let manager = CMMotionManager()
  
  func start() {
    guard manager.isAccelerometerAvailable else{
      print("accelerometer is not available")
      return
    }
    
    if manager.isAccelerometerActive { return }
    
    manager.accelerometerUpdateInterval = 1.0
    manager.startAccelerometerUpdates(to: OperationQueue.main) {[weak self](data, error) in
      if let error = error {
        print("error accelerometer updates; \(error.localizedDescription)")
      }else if let data = data {
        print("accelerometer data: \(data)")
        let accelerometerData = AccelerometerData(
          timestamp: data.timestamp,
          x: data.acceleration.x,
          y: data.acceleration.y,
          z: data.acceleration.z)
        
        self?.onUpdate?(accelerometerData)
      }
    }
  }
  
  func stop() {
    manager.stopAccelerometerUpdates()
  }
}
