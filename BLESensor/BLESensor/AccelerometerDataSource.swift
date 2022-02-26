//
//  AccelerometerDataSource.swift
//  BLESensor
//
//  Created by user on 2/25/22.
//

import Foundation

struct AccelerometerData: Codable {
  let timestamp: TimeInterval
  let x: Double
  let y: Double
  let z: Double
}

protocol AccelerometerDataSource {
  var onUpdate: ((AccelerometerData) -> Void)? {get set}
  
  func start()
  func stop()
}
