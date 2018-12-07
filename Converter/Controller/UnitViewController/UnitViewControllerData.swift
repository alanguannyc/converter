//
//  UnitViewControllerData.swift
//  Converter
//
//  Created by Alan on 10/17/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit
import SwiftyJSON
import Alamofire

// Logic that connects `TableViewController`'s data model with its user interface.
extension UnitViewController : typerProtocol{
    
    
    // MARK: - Delegate Methods
    func numberButtonTapped(unit: String, value: Double) {
        
        self.unitToMoniter = unit
        self.unitValueToMoniter = value
//        var indexOfChangingUnit : Int?
//        var newItem : [String: Double]?

        
        
        if (titleName == "Currency") {
            
            multiplier = value / (selectedCategory?.items.filter("name == '\(unit)'")[0].value)!
//            var newitem = selectedCategory?.items.first(where: { (unitItem) -> Bool in
//                unitItem.name == unit
//            })
            
            try! realm.write {
                selectedCategory?.baseValue = multiplier!
            }
            
//            for currencyItem in currency {
//
//                indexOfChangingUnit = currency.firstIndex(where: {$0.contains(where: {($0.key == unit)})})
//                var OriginalValue = unitItems?.filter("name == '\(unit)'")[0].value
//
//                newItem = updateExchangeRate(dict: currencyItem, unit: unit, value: value)
//
//                multiplier = value / OriginalValue!
//
//            }

        }
        
        
        itemTableView.reloadData()
    }
    
    func updateBasedOnBaseValue(dict:[String:Double],  multiplier : Double) -> [String:Double] {
        let convertedValue = dict.map { (key, val) in  (key, val * multiplier ) }
        return Dictionary(uniqueKeysWithValues: convertedValue)
    }
    
    
    func updateExchangeRate(dict:[String:Double], unit: String, value : Double) -> [String:Double]
    {
        let convertedValue = dict.map { (key, val) in key == unit ? (key, val) : (unit, value) }
        return Dictionary(uniqueKeysWithValues: convertedValue)
    }
    
    func updateUnitNumberLabel(unit : String, value : Double, cell : UnitTableViewCell) {
        
        try! realm.write {
            selectedCategory?.baseValue = value
        }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        let initalValue = CategoryMeasurement.initalValue(Type: selectedCategory!.name, unit: cell.UnitLabel.text!, value: (selectedCategory?.baseValue)!)
        var newBase = CategoryMeasurement.createNewValue(category: (selectedCategory?.name)!, unit: unit, value: value)
        switch newBase {
        case .unitLength(let value, let baseValue):
            let cellUnit = CategoryMeasurement.initalValue(Type: selectedCategory!.name, unit: cell.UnitLabel.text!, value: (selectedCategory?.baseValue)!)
            switch cellUnit {
                case .unitLength(let singleCellUnit, let value):
                    if formatter.string(for: singleCellUnit.convertedValue(basevalue: baseValue)) == "0" {
                        cell.NumberLabel.text = "0.0"
                    } else {
                        cell.NumberLabel.text = formatter.string(for: singleCellUnit.convertedValue(basevalue: baseValue))
                }
            case .unitArea(_, _):
                break
            case .unitVolume(_, _):
                break
            }
            
        case .unitArea(let value, let baseValue):
            let cellUnit = CategoryMeasurement.initalValue(Type: selectedCategory!.name, unit: cell.UnitLabel.text!, value: (selectedCategory?.baseValue)!)
            switch cellUnit {
            case .unitArea(let singleCellUnit, let value):
                if formatter.string(for: singleCellUnit.convertedValue(basevalue: baseValue)) == "0" {
                    cell.NumberLabel.text = "0.0"
                } else {
                    cell.NumberLabel.text = formatter.string(for: singleCellUnit.convertedValue(basevalue: baseValue))
                }
            case .unitLength(_, _):
                break
            case .unitVolume(_, _):
                break
            }
        case .unitVolume( _, let baseValue):
            let cellUnit = CategoryMeasurement.initalValue(Type: selectedCategory!.name, unit: cell.UnitLabel.text!, value: (selectedCategory?.baseValue)!)
            switch cellUnit {
            case .unitVolume(let singleCellUnit, _):
                if formatter.string(for: singleCellUnit.convertedValue(basevalue: baseValue)) == "0" {
                    cell.NumberLabel.text = "0.0"
                } else {
                    cell.NumberLabel.text = formatter.string(for: singleCellUnit.convertedValue(basevalue: baseValue))
                }
            case .unitArea(_, _):
                break
            case .unitLength(_, _):
                break
            }
        }
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableHeight.constant = itemTableView.contentSize.height
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (titleName == "Currency" ) {
//            return currency.count
//        } else {
//            return (requests?.count)!
//        }
        return (requests?.count)!
//        return (selectedCategory?.items.filter("picked == true").count)!

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            selectedCategory?.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("When tableview data reloaded, Currency list has", currency)
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "UnitTableViewCell") as! UnitTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.UnitLabel.text = unitItems?[indexPath.row].name
//        cell.UnitLabel.text = unitModel.placeNames[indexPath.row]
//        cell.UnitCalculatorView.isHidden = selectedIndex == indexPath.row ? false : true
        cell.delegate = self
        cell.typerDelegate = self
        if (selectedIndex == indexPath.row) {
            cell.UnitCalculatorView.isHidden = false
        } else {
            cell.UnitCalculatorView.isHidden = true
        }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        if (titleName == "Currency")  {
            if (selectedCategory?.baseValue == nil) {
                cell.UnitLabel.text = unitItems![indexPath.row].name
                cell.NumberLabel.text = String(0.0)
//                for (item, _) in unitItems![indexPath.row] {
//                    cell.UnitLabel.text = item
//
//                }
            }
            else if (selectedCategory?.baseValue != nil) {
                cell.UnitLabel.text = unitItems![indexPath.row].name
                cell.NumberLabel.text = formatter.string(for: unitItems![indexPath.row].value * (selectedCategory?.baseValue)!)
//                for (item, value) in currency[indexPath.row] {
//                    cell.UnitLabel.text = item
//                    cell.NumberLabel.text = formatter.string(for: value * multiplier!)
//                }
                
            } else {
                cell.UnitLabel.text = unitItems![indexPath.row].name
                cell.NumberLabel.text = formatter.string(for: unitItems![indexPath.row].value)
//                for (item, value) in currency[indexPath.row] {
//                    cell.UnitLabel.text = item
//                    cell.NumberLabel.text = String(value)
//
//                }
                
            }
        
        }
        else if unitToMoniter == nil {
            let initalValue = CategoryMeasurement.initalValue(Type: selectedCategory!.name, unit: cell.UnitLabel.text!, value: (selectedCategory?.baseValue)!)
            
            changeCellLabel(cell: cell, initalValue: initalValue)
        } 
        
        else if (unitValueToMoniter != nil) {
            updateUnitNumberLabel(unit: cell.UnitLabel.text!, value: unitValueToMoniter ?? 0.0, cell: cell)
        }
        
        cell.selectedCategory = selectedCategory?.name
        
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
        
        

//                UIStackView.animateVisibilityOfViews([cell.UnitCalculatorView], hidden: !cell.UnitCalculatorView.isHidden)
        self.itemTableView.beginUpdates()
        itemTableView.reloadData()
//        self.itemTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
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
    
    // MARK: - Update cell number by basevalue method
    func changeCellLabel(cell : UnitTableViewCell, initalValue: CategoryMeasurement) {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        switch initalValue {
            
        case .unitLength(let value, let baseValue):
            if formatter.string(for: value.convertedValue(basevalue: baseValue)) == "0" {
                cell.NumberLabel.text = "0.0"
            } else {
                cell.NumberLabel.text = formatter.string(for: value.convertedValue(basevalue: baseValue))
            }
        case .unitArea(let value, let baseValue):
            if formatter.string(for: value.convertedValue(basevalue: baseValue)) == "0" {
                cell.NumberLabel.text = "0.0"
            } else {
                cell.NumberLabel.text = formatter.string(for: value.convertedValue(basevalue: baseValue))
            }
        case .unitVolume(let value, let baseValue):
            if formatter.string(for: value.convertedValue(basevalue: baseValue)) == "0" {
                cell.NumberLabel.text = "0.0"
            } else {
                cell.NumberLabel.text = formatter.string(for: value.convertedValue(basevalue: baseValue))
            }
        }
    }
}




