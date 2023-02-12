//
//  CustomerRealmDTO.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import Foundation
import RealmSwift

final class CustomerRealmDTO: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var latitude: Double
    @Persisted var longitude: Double

    convenience init(id: Int, name: String, latitude: Double, longitude: Double) {
        self.init()

        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
