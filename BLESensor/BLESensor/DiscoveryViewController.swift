//
//  DiscoveryViewController.swift
//  BLESensor
//
//  Created by user on 2/17/22.
//

import UIKit

class DiscoveryViewController: UITableViewController {
  
  var central: BLECentral!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    central.onDiscovered = {[weak self] in
      self?.tableView.reloadData()
    }
    
    tableView.register(UINib(nibName: "DiscoveredPeripheralCell", bundle: nil),
                      forCellReuseIdentifier: "DiscoveredPeripheralCell")
  }

    // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return central.discoveredPeripherals.count
    
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoveredPeripheralCell", for: indexPath) as! DiscoveredPeripheralCell
    let discoveredPeripheral = central.discoveredPeripherals[indexPath.row]
    
    cell.identifierLabel.text = discoveredPeripheral.peripheral.identifier.uuidString
    cell.rssiLabel.text = discoveredPeripheral.rssi.stringValue
    cell.advertisementLabel.text = discoveredPeripheral.advertisementData.debugDescription
    
    cell.identifierLabel.textColor = .blue
    cell.rssiLabel.textColor = .red
    
    return cell
  }
}
