//
//  CardView.swift
//  Converter
//
//  Created by Alan on 10/15/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 2.0
    
    @IBInspectable var shadowColor : UIColor? = UIColor.gray
    
    @IBInspectable var shadowOffsetWith : Int = 1
    
    @IBInspectable var shadowOffsetHeight : Int = 2
    
    @IBInspectable var shadowOpacity : Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWith, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
}

