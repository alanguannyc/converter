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
        
        cell.UnitCalculatorView.isHidden = selectedIndex == indexPath.row ? false : true
        
//        if (selectedIndex == indexPath.row) {
//            cell.UnitCalculatorView.isHidden = false
//        } else {
//            cell.UnitCalculatorView.isHidden = true
//        }
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (selectedIndex == indexPath.row) {
            selectedIndex = -1
        } else {
            selectedIndex = indexPath.row
        }
        
//        itemTableView.reloadData()
//                UIStackView.animateVisibilityOfViews([cell.UnitCalculatorView], hidden: !cell.UnitCalculatorView.isHidden)
        self.itemTableView.beginUpdates()
        self.itemTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        self.itemTableView.endUpdates()

        self.itemTableView.deselectRow(at: indexPath, animated: true)
        

    }

    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        unitModel.moveItem(at: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
