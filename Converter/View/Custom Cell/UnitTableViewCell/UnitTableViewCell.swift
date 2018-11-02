//
//  UnitTableViewCell.swift
//  Converter
//
//  Created by Alan on 10/18/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit

protocol typerProtocol {
    func numberButtonTapped(newBaseValue:  Measurement<UnitLength>)
}

class UnitTableViewCell: UITableViewCell {
    

    @IBOutlet weak var UnitCalculatorView: UIView!
    @IBOutlet weak var backspaceButton: UIButton!
    
    @IBOutlet weak var buttonLayer: UIButton!
    
    @IBOutlet weak var UnitLabel: UILabel!
    
    @IBOutlet weak var NumberLabel: UILabel!
    
    var typerDelegate : typerProtocol?
    var typerLengthBaseValue = Measurement(value: 0.0, unit: UnitLength.meters)
    
    @IBAction func numberButtoned(_ sender: UIButton) {
        
        if NumberLabel.text == String("0") || NumberLabel.text == String("0.0") {
            NumberLabel.text = sender.currentTitle!

        } else {
            NumberLabel.text = NumberLabel.text! + sender.currentTitle!
        }
        
        var initalValue = Length(rawValue: UnitLabel.text!)
        typerLengthBaseValue = (initalValue?.changeBaseValue(value: Double(NumberLabel.text!)!))!
//        NumberLabel.text = String(initalValue!.convertedValue(basevalue: typerLengthBaseValue))
        
        typerDelegate?.numberButtonTapped(newBaseValue: typerLengthBaseValue)
    }
    
    @IBAction func operationButtoned(_ sender: UIButton) {
        typerDelegate?.numberButtonTapped(newBaseValue: typerLengthBaseValue)
    }
    @IBAction func clearButtoned(_ sender: UIButton) {
        NumberLabel.text = String(0.0)
        typerLengthBaseValue = Measurement(value: 0.0, unit: UnitLength.meters)
        typerDelegate?.numberButtonTapped(newBaseValue: typerLengthBaseValue)

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
    }
    
    @IBAction func backspaceButtoned(_ sender: UIButton) {
        if NumberLabel.text == String(0.0) {
            NumberLabel.text = String(0.0)
        } else if (NumberLabel.text?.count)! > 1 {
            NumberLabel.text = String(NumberLabel.text!.dropLast())
        } else {
            NumberLabel.text = String(0.0)
        }
        
        var initalValue = Length(rawValue: UnitLabel.text!)
        typerLengthBaseValue = (initalValue?.changeBaseValue(value: Double(NumberLabel.text!)!))!
        typerDelegate?.numberButtonTapped(newBaseValue: typerLengthBaseValue)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
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
