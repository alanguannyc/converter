//
//  LengthModel.swift
//  Converter
//
//  Created by Alan on 10/26/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

//var basevalue = Measurement(value: 0.0, unit: UnitLength.meters)
enum CategoryMeasurement {
   
    case unitLength(Length, Measurement<UnitLength>)
    case unitArea(Area, Measurement<UnitArea>)
    case unitVolume(Volume, Measurement<UnitVolume>)
    
    
    static func initalValue(Type: String, unit : String, value : Double) -> CategoryMeasurement {
        switch (Type) {
            
            case "Length":
                return CategoryMeasurement.unitLength(CategoryMeasurement.Length(rawValue: unit)!, Measurement(value: value, unit: UnitLength.meters))
            case "Area":
                return CategoryMeasurement.unitArea(CategoryMeasurement.Area(rawValue: unit)!, Measurement(value: value, unit: UnitArea.squareMeters))
            case "Volume":
                return CategoryMeasurement.unitVolume(CategoryMeasurement.Volume(rawValue: unit)!, Measurement(value: value, unit: UnitVolume.liters))
        default:
            fatalError("No such category")
        }
    }
    
    static func createNewValue(category: String, unit: String, value : Double) -> CategoryMeasurement {
        switch (category) {
        case "Length":
            return CategoryMeasurement.unitLength(CategoryMeasurement.Length(rawValue: unit)!, Measurement(value: value, unit: UnitLength.meters))
        case "Area":
            return CategoryMeasurement.unitArea(CategoryMeasurement.Area(rawValue: unit)!, Measurement(value: value, unit: UnitArea.squareMeters))
        case "Volume":
            return CategoryMeasurement.unitVolume(CategoryMeasurement.Volume(rawValue: unit)!, Measurement(value: value, unit: UnitVolume.liters))
        default:
            fatalError("No such category")
        
        }
    }
    
    
    
    
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
    
    
    
    
    
    
    enum Area: String, CaseIterable {
        
        case squareMegameters  = "Square Megameters"
        case squareKilometers  = "Square Kilometers"
        case squareMeters  = "Square Meters"
        case squareCentimeters  = "Square Centimeter"
        case squareMillimeters  = "Square Millimeters"
        case squareMicrometers  = "Square Micrometers"
        case squareNanometers  = "Square Nanometers"
        case squareInches  = "Square Inches"
        case squareFeet  = "Square Feet"
        case squareYards  = "Square Yards"
        case squareMiles  = "Square Miles"
        case acres  = "Acres"
        case ares  = "Ares"
        case hectares  = "Hectares"
        
        func convertedValue(basevalue: Measurement<UnitArea> ) -> Double {
            
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
                
            case .squareMegameters:
                return basevalue.converted(to: .squareMegameters).value
            case .squareKilometers:
                return basevalue.converted(to: .squareKilometers).value
            case .squareMeters:
                return basevalue.converted(to: .squareMeters).value
            case .squareCentimeters:
                return basevalue.converted(to: .squareCentimeters).value
            case .squareMillimeters:
                return basevalue.converted(to: .squareMillimeters).value
            case .squareMicrometers:
                return basevalue.converted(to: .squareMicrometers).value
            case .squareNanometers:
                return basevalue.converted(to: .squareNanometers).value
            case .squareInches:
                return basevalue.converted(to: .squareInches).value
            case .squareFeet:
                return basevalue.converted(to: .squareFeet).value
            case .squareYards:
                return basevalue.converted(to: .squareYards).value
            case .squareMiles:
                return basevalue.converted(to: .squareMiles).value
            case .acres:
                return basevalue.converted(to: .acres).value
            case .ares:
                return basevalue.converted(to: .ares).value
            case .hectares:
                return basevalue.converted(to: .hectares).value
            }
        }
        
        func changeBaseValue(value : Double) -> Measurement<UnitArea> {
            switch self {
                
            case .squareMegameters:
                return Measurement(value: value, unit: UnitArea.squareMegameters).converted(to: UnitArea.squareMeters)
            case .squareKilometers:
                return Measurement(value: value, unit: UnitArea.squareKilometers).converted(to: UnitArea.squareMeters)
            case .squareMeters:
                return Measurement(value: value, unit: UnitArea.squareMeters).converted(to: UnitArea.squareMeters)
            case .squareCentimeters:
                return Measurement(value: value, unit: UnitArea.squareCentimeters).converted(to: UnitArea.squareMeters)
            case .squareMillimeters:
                return Measurement(value: value, unit: UnitArea.squareMillimeters).converted(to: UnitArea.squareMeters)
            case .squareMicrometers:
                return Measurement(value: value, unit: UnitArea.squareMicrometers).converted(to: UnitArea.squareMeters)
            case .squareNanometers:
                return Measurement(value: value, unit: UnitArea.squareNanometers).converted(to: UnitArea.squareMeters)
            case .squareInches:
                return Measurement(value: value, unit: UnitArea.squareInches).converted(to: UnitArea.squareMeters)
            case .squareFeet:
                return Measurement(value: value, unit: UnitArea.squareFeet).converted(to: UnitArea.squareMeters)
            case .squareYards:
                return Measurement(value: value, unit: UnitArea.squareYards).converted(to: UnitArea.squareMeters)
            case .squareMiles:
                return Measurement(value: value, unit: UnitArea.squareMiles).converted(to: UnitArea.squareMeters)
            case .acres:
                return Measurement(value: value, unit: UnitArea.acres).converted(to: UnitArea.squareMeters)
            case .ares:
                return Measurement(value: value, unit: UnitArea.ares).converted(to: UnitArea.squareMeters)
            case .hectares:
                return Measurement(value: value, unit: UnitArea.hectares).converted(to: UnitArea.squareMeters)
            }
        }
        
    }
    
    
    enum Volume : String, CaseIterable{
        case megaliters  = "Megaliters"
        case kiloliters  = "Kiloliters"
        case liters  = "Liters"
        case deciliters  = "Deciliters"
        case centiliters  = "Centiliters"
        case milliliters  = "Milliliters"
        case cubicKilometers  = "Cubic Kilometers"
        case cubicMeters  = "Cubic Meters"
        case cubicDecimeters  = "Cubic Decimeters"
        case cubicMillimeters  = "Cubic Millimeters"
        case cubicInches  = "Cubic Inches"
        case cubicFeet  = "Cubic Feet"
        case cubicYards  = "Cubic Yards"
        case cubicMiles  = "Cubic Miles"
        case acreFeet  = "Acre Foeet"
        case bushels  = "Bushels"
        case teaspoons  = "Teaspoons"
        case tablespoons  = "Tablespoons"
        case fluidOunces  = "Fluid Ounces"
        case cups  = "Cups"
        case pints  = "Pints"
        case quarts  = "Quarts"
        case gallons  = "Gallons"
        case imperialTeaspoons  = "Imperial Teaspoons"
        case imperialTablespoons  = "Imperial Tablespoons"
        case imperialFluidOunces  = "Imperial Fluid Ounces"
        case imperialPints  = "Imperial Pints"
        case imperialQuarts  = "Imperial Quarts"
        case imperialGallons  = "Imperial Gallons"
        case metricCups  = "Metric Cups"
        
        
        func convertedValue(basevalue: Measurement<UnitVolume> ) -> Double {
            
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
                
            
            case .megaliters:
                return basevalue.converted(to: .megaliters).value
            case .kiloliters:
                return basevalue.converted(to: .kiloliters).value
            case .liters:
                return basevalue.converted(to: .liters).value
            case .deciliters:
                return basevalue.converted(to: .deciliters).value
            case .centiliters:
                return basevalue.converted(to: .centiliters).value
            case .milliliters:
                return basevalue.converted(to: .milliliters).value
            case .cubicKilometers:
                return basevalue.converted(to: .cubicKilometers).value
            case .cubicMeters:
                return basevalue.converted(to: .cubicMeters).value
            case .cubicDecimeters:
                return basevalue.converted(to: .cubicDecimeters).value
            case .cubicMillimeters:
                return basevalue.converted(to: .cubicMillimeters).value
            case .cubicInches:
                return basevalue.converted(to: .cubicInches).value
            case .cubicFeet:
                return basevalue.converted(to: .cubicFeet).value
            case .cubicYards:
                return basevalue.converted(to: .cubicYards).value
            case .cubicMiles:
                return basevalue.converted(to: .cubicMiles).value
            case .acreFeet:
                return basevalue.converted(to: .acreFeet).value
            case .bushels:
                return basevalue.converted(to: .bushels).value
            case .teaspoons:
                return basevalue.converted(to: .teaspoons).value
            case .tablespoons:
                return basevalue.converted(to: .tablespoons).value
            case .fluidOunces:
                return basevalue.converted(to: .fluidOunces).value
            case .cups:
                return basevalue.converted(to: .cups).value
            case .pints:
                return basevalue.converted(to: .pints).value
            case .quarts:
                return basevalue.converted(to: .quarts).value
            case .gallons:
                return basevalue.converted(to: .gallons).value
            case .imperialTeaspoons:
                return basevalue.converted(to: .imperialTeaspoons).value
            case .imperialTablespoons:
                return basevalue.converted(to: .imperialTablespoons).value
            case .imperialFluidOunces:
                return basevalue.converted(to: .imperialFluidOunces).value
            case .imperialPints:
                return basevalue.converted(to: .imperialPints).value
            case .imperialQuarts:
                return basevalue.converted(to: .imperialQuarts).value
            case .imperialGallons:
                return basevalue.converted(to: .imperialGallons).value
            case .metricCups:
                return basevalue.converted(to: .metricCups).value
            }
        }
        
        func changeBaseValue(value : Double) -> Measurement<UnitVolume> {
            switch self {
                
            case .megaliters:
                return Measurement(value: value, unit: UnitVolume.megaliters).converted(to: UnitVolume.liters)
            case .kiloliters:
               return Measurement(value: value, unit: UnitVolume.kiloliters).converted(to: UnitVolume.liters)
            case .liters:
               return Measurement(value: value, unit: UnitVolume.liters).converted(to: UnitVolume.liters)
            case .deciliters:
               return Measurement(value: value, unit: UnitVolume.deciliters).converted(to: UnitVolume.liters)
            case .centiliters:
               return Measurement(value: value, unit: UnitVolume.centiliters).converted(to: UnitVolume.liters)
            case .milliliters:
               return Measurement(value: value, unit: UnitVolume.milliliters).converted(to: UnitVolume.liters)
            case .cubicKilometers:
              return  Measurement(value: value, unit: UnitVolume.cubicKilometers).converted(to: UnitVolume.liters)
            case .cubicMeters:
              return  Measurement(value: value, unit: UnitVolume.cubicMeters).converted(to: UnitVolume.liters)
            case .cubicDecimeters:
              return  Measurement(value: value, unit: UnitVolume.cubicDecimeters).converted(to: UnitVolume.liters)
            case .cubicMillimeters:
              return  Measurement(value: value, unit: UnitVolume.cubicMillimeters).converted(to: UnitVolume.liters)
            case .cubicInches:
              return  Measurement(value: value, unit: UnitVolume.cubicInches).converted(to: UnitVolume.liters)
            case .cubicFeet:
              return  Measurement(value: value, unit: UnitVolume.cubicFeet).converted(to: UnitVolume.liters)
            case .cubicYards:
              return  Measurement(value: value, unit: UnitVolume.cubicYards).converted(to: UnitVolume.liters)
            case .cubicMiles:
              return  Measurement(value: value, unit: UnitVolume.cubicMiles).converted(to: UnitVolume.liters)
            case .acreFeet:
              return  Measurement(value: value, unit: UnitVolume.acreFeet).converted(to: UnitVolume.liters)
            case .bushels:
              return  Measurement(value: value, unit: UnitVolume.bushels).converted(to: UnitVolume.liters)
            case .teaspoons:
              return  Measurement(value: value, unit: UnitVolume.teaspoons).converted(to: UnitVolume.liters)
            case .tablespoons:
              return  Measurement(value: value, unit: UnitVolume.tablespoons).converted(to: UnitVolume.liters)
            case .fluidOunces:
              return  Measurement(value: value, unit: UnitVolume.fluidOunces).converted(to: UnitVolume.liters)
            case .cups:
              return  Measurement(value: value, unit: UnitVolume.cups).converted(to: UnitVolume.liters)
            case .pints:
              return  Measurement(value: value, unit: UnitVolume.pints).converted(to: UnitVolume.liters)
            case .quarts:
              return  Measurement(value: value, unit: UnitVolume.quarts).converted(to: UnitVolume.liters)
            case .gallons:
              return  Measurement(value: value, unit: UnitVolume.gallons).converted(to: UnitVolume.liters)
            case .imperialTeaspoons:
              return  Measurement(value: value, unit: UnitVolume.imperialTeaspoons).converted(to: UnitVolume.liters)
            case .imperialTablespoons:
              return  Measurement(value: value, unit: UnitVolume.imperialTablespoons).converted(to: UnitVolume.liters)
            case .imperialFluidOunces:
              return  Measurement(value: value, unit: UnitVolume.imperialFluidOunces).converted(to: UnitVolume.liters)
            case .imperialPints:
              return  Measurement(value: value, unit: UnitVolume.imperialPints).converted(to: UnitVolume.liters)
            case .imperialQuarts:
              return  Measurement(value: value, unit: UnitVolume.imperialQuarts).converted(to: UnitVolume.liters)
            case .imperialGallons:
              return  Measurement(value: value, unit: UnitVolume.imperialGallons).converted(to: UnitVolume.liters)
            case .metricCups:
              return  Measurement(value: value, unit: UnitVolume.metricCups).converted(to: UnitVolume.liters)
            }
        }
        
        
    }
}




// MARK: - Set base value
func setBaseValue(value : Double, unit: UnitLength) -> Measurement<UnitLength> {
    
    return Measurement(value: value, unit: unit).converted(to: UnitLength.meters)
    
}



