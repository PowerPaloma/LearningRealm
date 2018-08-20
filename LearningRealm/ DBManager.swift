//
//   DBManager.swift
//  LearningRealm
//
//  Created by Ada 2018 on 14/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    private var database: Realm
    static var sharedInstance = DBManager()
    
    private init(){
        database = try! Realm()
    }
    
    func getDataOfEntity<T: Object>(entity: T.Type) -> Results<T>{
        return database.objects(T.self)
    }
    
    func add(Object obj: Object){
        try! database.write {
            database.add(obj)
        }
    }
    func update<T: Object>(Object obj: T){
        try! database.write {
            database.add(obj, update: true)
        }
    }
    
    func delete<T: Object>(Object obj: T)   {
        try!   database.write {
            database.delete(obj)
        }
    }

    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    func query<T: Object>(query: NSPredicate) -> Results<T> {
        return database.objects(T.self).filter(query)
    }
    
    
}


