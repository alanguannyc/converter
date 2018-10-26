//
//  RoundButton.swift
//  Converter
//
//  Created by Alan on 10/18/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit

class RoundButton:  UIButton {
    
    override func awakeFromNib() {
        self.backgroundColor = .clear
        layer.cornerRadius = layer.frame.width/2
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
   
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray.withAlphaComponent(0.75) : UIColor.clear
        }
    }
    
//    override var isHighlighted: Bool {
//        didSet {
//
//            if (isHighlighted) {
//                backgroundColor = UIColor.blue
//            }
//            else {
//                backgroundColor = UIColor.clear
//            }
//
//        }
//    }
    
}


