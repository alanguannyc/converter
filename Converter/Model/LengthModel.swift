//
//  LengthModel.swift
//  Converter
//
//  Created by Alan on 10/26/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
//var basevalue = Measurement(value: 0.0, unit: UnitLength.meters)
enum Length : String, CaseIterable{
    case miles = "Miles"
    case meters = "Meters"
    case kilometers = "Kilometers"
    
    func convertedValue(basevalue: Measurement<UnitLength> ) -> Double {
        
        // Create a basevalue for converting and formatter
        let formatter = MeasurementFormatter()
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        formatter.numberFormatter = numberFormatter
        
        formatter.numberFormatter.numberStyle = .none
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        formatter.locale = Locale(identifier: "en-US")
        
        switch self {
            
        case .miles:
             print(basevalue.converted(to: .miles).value)
             return basevalue.converted(to: .miles).value
        case .meters:
            print(basevalue.converted(to: .meters).value)
            return basevalue.converted(to: .meters).value
        case .kilometers:
            print(basevalue.converted(to: .kilometers).value)
            return basevalue.converted(to: .kilometers).value
        }
    }
    
    func changeBaseValue(value : Double) -> Measurement<UnitLength> {
        switch self {
        case .miles:
            return Measurement(value: value, unit: UnitLength.miles).converted(to: UnitLength.meters)
        case .meters:
            return Measurement(value: value, unit: UnitLength.meters).converted(to: UnitLength.meters)
        case .kilometers:
            return setBaseValue(value: value, unit: UnitLength.kilometers)
        }
    }
    
}


func setBaseValue(value : Double, unit: UnitLength) -> Measurement<UnitLength> {
    
    return Measurement(value: value, unit: unit).converted(to: UnitLength.meters)
    
}
