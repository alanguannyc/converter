//
//  UnitCategory.swift
//  Converter
//
//  Created by Alan on 10/22/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import RealmSwift

class UnitCategory: Object {
    @objc dynamic var name = ""
//    @objc dynamic var id = 0
    
    let items = List<UnitItem>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
}

