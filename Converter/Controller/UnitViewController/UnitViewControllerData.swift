//
//  UnitViewControllerData.swift
//  Converter
//
//  Created by Alan on 10/17/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit

// Logic that connects `TableViewController`'s data model with its user interface.
extension UnitViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitModel.placeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "UnitTableViewCell") as! UnitTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.UnitLabel.text = unitModel.placeNames[indexPath.row]
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        unitModel.moveItem(at: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
