//
//  User.swift
//  LearningRealm
//
//  Created by Ada 2018 on 14/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class User: Object {
    
    @objc dynamic var ID = ""
    @objc dynamic var name = ""
    @objc dynamic var image = ""
    @objc dynamic var senha = ""
    var contacts = List<Contact>()
    
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
    func setID(){
        var id = ""
        do {
            let realm = try Realm()
            
            id = NSUUID().uuidString
            while realm.object(ofType: User.self, forPrimaryKey: id) != nil {
                id = NSUUID().uuidString
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        self.ID = id
    }
   
    
}
