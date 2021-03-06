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

    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    @objc dynamic var user: User!
    @objc dynamic var ID = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
    func setID(){
        var id = ""
        do {
            let realm = try Realm()
            
            id = NSUUID().uuidString
            while realm.object(ofType: Contact.self, forPrimaryKey: id) != nil {
                id = NSUUID().uuidString
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        self.ID = id
    }
    
    
}
