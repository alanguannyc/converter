//
//  LengthModel.swift
//  Converter
//
//  Created by Alan on 10/26/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
var basevalue = Measurement(value: 0.0, unit: UnitLength.meters)
enum Length : String{
    case miles = "Miles"
    case meters = "Meters"
    case kilometers = "Kilometers"
    
    func inside() -> Double {
        switch self {
            
        case .miles:
            return basevalue.converted(to: .miles).value
        case .meters:
            return basevalue.converted(to: .meters).value
        case .kilometers:
            return basevalue.converted(to: .kilometers).value
        }
    }
    
    func changeBaseValue(value : Double) {
        switch self {
        case .miles:
            return basevalue = Measurement(value: value, unit: UnitLength.miles).converted(to: UnitLength.meters)
        case .meters:
            return basevalue = Measurement(value: value, unit: UnitLength.meters).converted(to: UnitLength.meters)
        case .kilometers:
            return basevalue = setBaseValue(value: value, unit: UnitLength.kilometers)
        }
    }
    
}


func setBaseValue(value : Double, unit: UnitLength) -> Measurement<UnitLength> {
    
    return Measurement(value: value, unit: unit).converted(to: UnitLength.meters)
    
}
