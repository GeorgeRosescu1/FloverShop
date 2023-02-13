//
//  RealmService.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import Foundation
import RealmSwift

struct RealmService {

    static func saveObject(_ object: some Object) {
        let realm: Realm = try! Realm()

        try! realm.write {
            realm.add(object, update: .modified)
        }
    }

    static func saveObjects(_ objects: [some Object]) {
        let realm: Realm = try! Realm()

        try! realm.write {
            realm.add(objects, update: .modified)
        }
    }

    static func getAllObjects<T: Object>() -> [T] {
        let realm: Realm = try! Realm()

        return Array(realm.objects(T.self))
    }
}
