
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
                ["name":"Megameters","picked": false],
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
            
            
            
            
//            ["id":"0" as AnyObject, "name":"Length" as AnyObject, "items": [["name":"Megameters"], ["name":"Kilometers"]] as AnyObject],
//            ["name":"Temperature","id":"1"],
//            ["name":"Area","id":"2"]
        
    ]
    

}





