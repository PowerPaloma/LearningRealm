//
//  Contact.swift
//  LearningRealm
//
//  Created by Ada 2018 on 14/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
    
    @objc dynamic var ID = 0
    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
