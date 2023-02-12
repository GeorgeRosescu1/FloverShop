//
//  RealmService.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import Foundation
import RealmSwift

struct RealmService {

    let realm: Realm

    init() {
        realm = try! Realm()
    }

    func saveOrder(_ object: OrderRealmDTO) {
        try! realm.write {
            realm.add(object)
        }
    }

    func getAllOrders() -> [OrderRealmDTO] {
        Array(realm.objects(OrderRealmDTO.self))
    }
}
