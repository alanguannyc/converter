
//
//  UnitModel.swift
//  Converter
//
//  Created by Alan on 10/17/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation

struct CategoryModel {
    private(set) var categoryDataset : [[String: AnyObject]] =
        [
            ["name":"Length" as AnyObject, "items": [
                
                ["name":"Miles", "picked": true],
                ["name":"Meters", "picked": true],
                ["name":"Kilometers", "picked": true],
                ["name":"Megameters","picked": true],
                ["name":"Hectometers","picked": false],
                ["name":"Decameters","picked": false],
                ["name":"Decimeters","picked": false],
                ["name":"Centimeters","picked": false],
                ["name":"Millimeters","picked": false],
                ["name":"Micrometers","picked": false],
                ["name":"Nanometers","picked": false],
                ["name":"Picometers","picked": false],
                ["name":"Inches","picked": false],
                ["name":"Feet","picked": false],
                ["name":"Yards","picked": false],
                ["name":"Scandinavian Miles","picked": false],
                ["name":"Light Years","picked": false],
                ["name":"Nautical Miles","picked": false],
                ["name":"Fathoms","picked": false],
                ["name":"Furlongs","picked": false],
                ["name":"Astronomical Units","picked": false],
                ["name":"Parsecs","picked": false],
                
                    ] as AnyObject],

            ["name":"Volume" as AnyObject, "items": [
            
                ["name":"Megaliters","picked" : false],
                ["name":"Kiloliters","picked" : true],
                ["name":"Liters","picked" : true],
                ["name":"Deciliters","picked" : false],
                ["name":"Centiliters","picked" : false],
                ["name":"Milliliters","picked" : false],
                ["name":"Cubic Kilometers","picked" : false],
                ["name":"Cubic Meters","picked" : false],
                ["name":"Cubic Decimeters","picked" : false],
                ["name":"Cubic Millimeters","picked" : false],
                ["name":"Cubic Inches","picked" : false],
                ["name":"Cubic Feet","picked" : false],
                ["name":"Cubic Yards","picked" : false],
                ["name":"Cubic Miles","picked" : false],
                ["name":"Acre Foeet","picked" : false],
                ["name":"Bushels","picked" : false],
                ["name":"Teaspoons","picked" : false],
                ["name":"Tablespoons","picked" : false],
                ["name":"Fluid Ounces","picked" : false],
                ["name":"Cups","picked" : true],
                ["name":"Pints","picked" : false],
                ["name":"Quarts","picked" : false],
                ["name":"Gallons","picked" : false],
                ["name":"Imperial Teaspoons","picked" : false],
                ["name":"Imperial Tablespoons","picked" : false],
                ["name":"Imperial Fluid Ounces","picked" : false],
                ["name":"Imperial Pints","picked" : false],
                ["name":"Imperial Quarts","picked" : false],
                ["name":"Imperial Gallons","picked" : false],
                ["name":"Metric Cups","picked" : false]
            
                ] as AnyObject],
            
            ["name":"Area" as AnyObject, "items": [
                ["name":"Square Megameters","picked" : false],
                ["name":"Square Kilometers","picked" : true],
                ["name":"Square Meters","picked" : true],
                ["name":"Square Centimeter","picked" : false],
                ["name":"Square Millimeters","picked" : false],
                ["name":"Square Micrometers","picked" : false],
                ["name":"Square Nanometers","picked" : false],
                ["name":"Square Inches","picked" : false],
                ["name":"Square Feet","picked" : true],
                ["name":"Square Yards","picked" : false],
                ["name":"Square Miles","picked" : false],
                ["name":"Acres","picked" : false],
                ["name":"Ares","picked" : false],
                ["name":"Hectares","picked" : false]
                
                ] as AnyObject]
        
    ]
    

}





