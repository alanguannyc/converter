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
    case megameters = "Megameters"
    case hectometers = "Hectometers"
    case decameters = "Decameters"
    case decimeters = "Decimeters"
    case centimeters = "Centimeters"
    case millimeters = "Millimeters"
    case micrometers = "Micrometers"
    case nanometers = "Nanometers"
    case picometers = "Picometers"
    case inches = "Inches"
    case feet = "Feet"
    case yards = "Yards"
    case scandinavianMiles = "Scandinavian Miles"
    case lightyears = "Light Years"
    case nauticalMiles = "Nautical Miles"
    case fathoms = "Fathoms"
    case furlongs = "Furlongs"
    case astronomicalUnits = "Astronomical Units"
    case parsecs = "Parsecs"
    
    
    
    
    
    
    
    
    
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
             return basevalue.converted(to: .miles).value
        case .meters:
            return basevalue.converted(to: .meters).value
        case .kilometers:
            return basevalue.converted(to: .kilometers).value
        case .megameters:
            return basevalue.converted(to: .megameters).value
        case .hectometers:
            return basevalue.converted(to: .hectometers).value
        case .decameters:
            return basevalue.converted(to: .decameters).value
        case .decimeters:
            return basevalue.converted(to: .decimeters).value
        case .centimeters:
            return basevalue.converted(to: .centimeters).value
        case .millimeters:
            return basevalue.converted(to: .millimeters).value
        case .micrometers:
            return basevalue.converted(to: .micrometers).value
        case .nanometers:
            return basevalue.converted(to: .nanometers).value
        case .picometers:
            return basevalue.converted(to: .picometers).value
        case .inches:
            return basevalue.converted(to: .inches).value
        case .feet:
            return basevalue.converted(to: .feet).value
        case .yards:
            return basevalue.converted(to: .yards).value
        case .scandinavianMiles:
            return basevalue.converted(to: .scandinavianMiles).value
        case .lightyears:
            return basevalue.converted(to: .lightyears).value
        case .nauticalMiles:
            return basevalue.converted(to: .nauticalMiles).value
        case .fathoms:
            return basevalue.converted(to: .fathoms).value
        case .furlongs:
            return basevalue.converted(to: .furlongs).value
        case .astronomicalUnits:
            return basevalue.converted(to: .astronomicalUnits).value
        case .parsecs:
            return basevalue.converted(to: .parsecs).value
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
        case .megameters:
            return setBaseValue(value: value, unit: UnitLength.megameters)
        case .hectometers:
            return setBaseValue(value: value, unit: UnitLength.hectometers)
        case .decameters:
            return setBaseValue(value: value, unit: UnitLength.decameters)
        case .decimeters:
            return setBaseValue(value: value, unit: UnitLength.decimeters)
        case .centimeters:
            return setBaseValue(value: value, unit: UnitLength.centimeters)
        case .millimeters:
            return setBaseValue(value: value, unit: UnitLength.millimeters)
        case .micrometers:
            return setBaseValue(value: value, unit: UnitLength.micrometers)
        case .nanometers:
            return setBaseValue(value: value, unit: UnitLength.nanometers)
        case .picometers:
            return setBaseValue(value: value, unit: UnitLength.picometers)
        case .inches:
            return setBaseValue(value: value, unit: UnitLength.inches)
        case .feet:
            return setBaseValue(value: value, unit: UnitLength.feet)
        case .yards:
            return setBaseValue(value: value, unit: UnitLength.yards)
        case .scandinavianMiles:
            return setBaseValue(value: value, unit: UnitLength.scandinavianMiles)
        case .lightyears:
            return setBaseValue(value: value, unit: UnitLength.lightyears)
        case .nauticalMiles:
            return setBaseValue(value: value, unit: UnitLength.nauticalMiles)
        case .fathoms:
            return setBaseValue(value: value, unit: UnitLength.fathoms)
        case .furlongs:
            return setBaseValue(value: value, unit: UnitLength.furlongs)
        case .astronomicalUnits:
            return setBaseValue(value: value, unit: UnitLength.astronomicalUnits)
        case .parsecs:
            return setBaseValue(value: value, unit: UnitLength.parsecs)
        }
    }
    
}


func setBaseValue(value : Double, unit: UnitLength) -> Measurement<UnitLength> {
    
    return Measurement(value: value, unit: unit).converted(to: UnitLength.meters)
    
}
