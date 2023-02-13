//
//  OrderRealmMapper.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import Foundation

struct OrderRealmMapper: Mapper {

    static func map(from dto: OrderRealmDTO) -> Order? {
        guard let status = OrderStatus(rawValue: dto.status) else {
            return nil
        }

        return Order(id: dto.id,
                     description: dto.orderDescription,
                     price: dto.price,
                     customerId: dto.customerId,
                     imageURL: dto.imageURL,
                     status: status)
    }
}
