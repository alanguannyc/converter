//
//  UnitTableViewCell.swift
//  Converter
//
//  Created by Alan on 10/18/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import SwipeCellKit

protocol typerProtocol {
    func numberButtonTapped(unit: String, value: Double)
}

class UnitTableViewCell: SwipeTableViewCell, categoryProtocol, DataModelDelegate {
    func receiveData(data: String) {
        selectedCategory = data
    
    }


    @IBOutlet weak var UnitCalculatorView: UIView!
    @IBOutlet weak var backspaceButton: UIButton!
    
    @IBOutlet weak var buttonLayer: UIButton!
    
    @IBOutlet weak var UnitLabel: UILabel!
    
    @IBOutlet weak var NumberLabel: UILabel!
    
    var typerDelegate : typerProtocol?
    var typerLengthBaseValue = Measurement(value: 0.0, unit: UnitLength.meters)
    
    var selectedCategory : String?
    
    func categorySelected(category: String) {
        
        selectedCategory = category
        
    }
    
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
    @IBAction func numberButtoned(_ sender: UIButton) {
//        categoryViewController.sendData()
        if NumberLabel.text == String("0") || NumberLabel.text == String("0.0") {
            NumberLabel.text = sender.currentTitle!

        } else {
            NumberLabel.text = NumberLabel.text! + sender.currentTitle!
        }
       
        if selectedCategory == "Currency" {
            
            typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: Double(NumberLabel.text!)!)
            
        } else {
            let initalValue = CategoryMeasurement.initalValue(Type: selectedCategory ?? "Length", unit: UnitLabel.text!)
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            //        typerLengthBaseValue = (initalValue?.changeBaseValue(value: Double(NumberLabel.text!)!))!
            switch initalValue {
            case .unitLength(let value,  _):
                let newBaseValue = value.changeBaseValue(value: Double(NumberLabel.text!)!).value
                typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: newBaseValue)
                
            case .unitArea(let value, _):
                let newBaseValue = value.changeBaseValue(value: Double(NumberLabel.text!)!).value
                typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: newBaseValue)
                
            case .unitVolume(let value,  _):
                let newBaseValue = value.changeBaseValue(value: Double(NumberLabel.text!)!).value
                typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: newBaseValue)
                
            }
        }
        
        
        
        
        
    }
    
    @IBAction func operationButtoned(_ sender: UIButton) {
        if selectedCategory == "Currency" {
            
            typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: Double(NumberLabel.text!)!)
            
        }
//        typerDelegate?.numberButtonTapped(newBaseValue: typerLengthBaseValue)
    }
    @IBAction func clearButtoned(_ sender: UIButton) {
        
        NumberLabel.text = String(0.0)
        
        if selectedCategory == "Currency" {
            
            typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: Double(NumberLabel.text!)!)
            
        }
        
        typerLengthBaseValue = Measurement(value: 0.0, unit: UnitLength.meters)
        
        
//        typerDelegate?.numberButtonTapped(newBaseValue: typerLengthBaseValue)

    }
    @IBAction func dotButtoned(_ sender: UIButton) {
        
        if NumberLabel.text == String(0.0) {
            NumberLabel.text = "0."
        }
        else{
            if NumberLabel.text?.range(of: ".") == nil{
                NumberLabel.text = NumberLabel.text! + "."
            }
        }
        
        if selectedCategory == "Currency" {
            
            typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: Double(NumberLabel.text!)!)
            
        }
    }
    
    @IBAction func backspaceButtoned(_ sender: UIButton) {
        if NumberLabel.text == String(0.0) {
            NumberLabel.text = String(0.0)
        } else if (NumberLabel.text?.count)! > 1 {
            NumberLabel.text = String(NumberLabel.text!.dropLast())
        } else {
            NumberLabel.text = String(0.0)
        }
        
        if selectedCategory == "Currency" {
            
            typerDelegate?.numberButtonTapped(unit: UnitLabel.text!, value: Double(NumberLabel.text!)!)
            
        }
        
//        var initalValue = Length(rawValue: UnitLabel.text!)
//        typerLengthBaseValue = (initalValue?.changeBaseValue(value: Double(NumberLabel.text!)!))!
//        typerDelegate?.numberButtonTapped(newBaseValue: typerLengthBaseValue)
    }
    
    var categoryViewController = UnitViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        categoryViewController.dataDelegate = self
        
//        selectedCategory = dataModel.selectedCategory!.name


        
        
        // Initialization code
        backspaceButton.setImage(UIImage(named: "backspace"), for:  .normal)
        backspaceButton.imageView?.contentMode = .scaleAspectFit
        backspaceButton.setTitleColor(.black, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
    
}
