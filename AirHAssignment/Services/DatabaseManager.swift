//
//  DatabaseManager.swift
//  HeadyECommerce
//
//  Created by Nirav Hathi on 7/4/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation
import RealmSwift
class DatabaseManager {
    static let shared = DatabaseManager()
    let realm = try! Realm()
    private init(){}
    func storeData<T: Object>(_ data: Object, type : T.Type) {
        print(realm.configuration.fileURL!)
            print(data)
            try! self.realm.write {
                self.realm.create(type, value: data, update: .modified)
            }
        
    }
    func getAllData() -> Duties {
        var realm: Realm?
        var results: Duties?
        realm = try! Realm()
        results = realm?.object(ofType: Duties.self, forPrimaryKey: 0)
        return results ?? Duties()
    }
}
extension Results {
    func toArray<T>(ofType: T.Type) -> List<T> {
        let array = List<T>()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
