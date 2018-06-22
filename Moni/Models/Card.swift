//
//  Card.swift
//  Moni
//
//  Created by Víctor Vicente on 19/06/2018.
//  Copyright © 2018 DevSoul. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Card: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var number = ""
    @objc dynamic var cvv = ""
    @objc dynamic var month = ""
    @objc dynamic var year = ""
    
    required init() {
        super.init()
    }
    
    init(title: String, number: String, month: String, year: String, cvv: String) {
        super.init()
        
        self.title = title
        self.number = number
        self.month = month
        self.year = year
        self.cvv = cvv
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
