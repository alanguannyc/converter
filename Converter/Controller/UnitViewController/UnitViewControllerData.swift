//
//  UnitViewControllerData.swift
//  Converter
//
//  Created by Alan on 10/17/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import RealmSwift

// Logic that connects `TableViewController`'s data model with its user interface.
extension UnitViewController : typerProtocol{
    func numberButtonTapped(newBaseValue: Measurement<UnitLength>) {
        basevalue = newBaseValue
        itemTableView.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableHeight.constant = itemTableView.contentSize.height
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitItems?.count ?? 1
//        return unitModel.placeNames.count
    }
     
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "UnitTableViewCell") as! UnitTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.UnitLabel.text = unitItems?[indexPath.row].name
//        cell.UnitLabel.text = unitModel.placeNames[indexPath.row]
//        cell.UnitCalculatorView.isHidden = selectedIndex == indexPath.row ? false : true
        cell.typerDelegate = self
        if (selectedIndex == indexPath.row) {
            cell.UnitCalculatorView.isHidden = false
        } else {
            cell.UnitCalculatorView.isHidden = true
        }
//        print(basevalue.value)
        let initalValue = Length(rawValue: cell.UnitLabel.text!)
//        basevalue = (initalValue?.changeBaseValue(value: Double(cell.NumberLabel.text!)!))!
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        if formatter.string(for: initalValue!.convertedValue(basevalue: basevalue)) == "0" {
            cell.NumberLabel.text = "0.0"
        } else {
            cell.NumberLabel.text = formatter.string(for: initalValue!.convertedValue(basevalue: basevalue))
        }
        

        //change highlight background color of cells
        let backgroundView = UIView()
        //        backgroundView.backgroundColor = cell.cellBackground.backgroundColor
        backgroundView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        cell.selectedBackgroundView = backgroundView
        
        
        return cell
        
        
    }
    
    
    
    func setBaseValue(value : Double, unit: UnitLength) -> Measurement<UnitLength> {
        
        return Measurement(value: value, unit: unit).converted(to: UnitLength.meters)
        
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
        itemTableView.reloadData()
        self.itemTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        self.itemTableView.endUpdates()

        self.itemTableView.deselectRow(at: indexPath, animated: false)
        

    }

    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        unitModel.moveItem(at: sourceIndexPath.row, to: destinationIndexPath.row)
        
//        var index = realm.objects(UnitItem.self).index(of: unitItems![indexPath.row])
        do{
            try realm.write {
                selectedCategory?.items.swapAt(sourceIndexPath.row, destinationIndexPath.row)
            }
        } catch {
            print("Error changing the order \(error)")
        }
    }
}
