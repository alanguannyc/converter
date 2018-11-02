//
//  UnitItem.swift
//  Converter
//
//  Created by Alan on 10/22/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
import RealmSwift

class UnitItem: Object {
//    @objc dynamic var index : Int = 0
    @objc dynamic var name = ""
    @objc dynamic var picked : Bool = true
    
    var ParentCategory = LinkingObjects(fromType: UnitCategory.self, property: "items")
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    
}
