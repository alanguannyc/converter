//
//  UnitModel.swift
//  Converter
//
//  Created by Alan on 10/17/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation

struct UnitModel {
    private(set) var placeNames = [
        "Adler Planetarium",
        "Art Institute of Chicago",
        "Field Museum of Natural History",
        "Lincoln Park Zoo",
        "Millennium Park",
        "Museum of Science and Industry",
        "Navy Pier",
        "Shedd Aquarium",
        "Wrigley Field",
        "Adler Planetarium",
        "Art Institute of Chicago",
        "Field Museum of Natural History",
        "Lincoln Park Zoo",
        "Millennium Park",
        "Museum of Science and Industry",
        "Navy Pier",
        "Shedd Aquarium",
        "Wrigley Field"
    ]
    
    /// The traditional method for rearranging rows in a table view.
    mutating func moveItem(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let place = placeNames[sourceIndex]
        placeNames.remove(at: sourceIndex)
        placeNames.insert(place, at: destinationIndex)
    }
    
    /// The method for adding a new item to the table view's data model.
    mutating func addItem(_ place: String, at index: Int) {
        placeNames.insert(place, at: index)
    }
}
