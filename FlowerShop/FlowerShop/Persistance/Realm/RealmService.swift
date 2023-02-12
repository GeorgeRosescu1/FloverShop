//
//  RealmService.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import Foundation
import RealmSwift

struct RealmService {

    static func saveOrder(_ order: OrderRealmDTO) {
        let realm: Realm = try! Realm()

        try! realm.write {
            realm.add(order)
        }
    }

    static func saveOrders(_ orders: [OrderRealmDTO]) {
        let realm: Realm = try! Realm()

        try! realm.write {
            realm.add(orders)
        }
    }

    static func getAllOrders() -> [OrderRealmDTO] {
        let realm: Realm = try! Realm()

        return Array(realm.objects(OrderRealmDTO.self))
    }

    static func saveCustomer(_ object: CustomerRealmDTO) {
        let realm: Realm = try! Realm()

        try! realm.write {
            realm.add(object)
        }
    }

    static func saveCustomers(_ customers: [CustomerRealmDTO]) {
        let realm: Realm = try! Realm()

        try! realm.write {
            realm.add(customers)
        }
    }

    static func getAllCustomers() -> [CustomerRealmDTO] {
        let realm: Realm = try! Realm()

        return Array(realm.objects(CustomerRealmDTO.self))
    }
}
