//
//  OrderRealmDTO.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import Foundation
import RealmSwift

final class OrderRealmDTO: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var orderDescription: String
    @Persisted var price: Int
    @Persisted var customerId: Int
    @Persisted var imageURL: String
    @Persisted var status: String

    convenience init(id: Int,
                     orderDescription: String,
                     price: Int,
                     customerId: Int,
                     imageURL: String,
                     status: String) {
        self.init()
        
        self.id = id
        self.orderDescription = orderDescription
        self.price = price
        self.customerId = customerId
        self.imageURL = imageURL
        self.status = status
    }
}
