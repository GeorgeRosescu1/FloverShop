//
//  OrderMapper.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

struct OrderMapper: Mapper {

    static func map(from dto: OrderDTO) -> Order? {
        guard let status = OrderStatus(rawValue: dto.status) else {
            return nil
        }

        return Order(id: dto.id,
                     description: dto.description,
                     price: dto.price,
                     customerId: dto.customerId,
                     imageURL: dto.imageURL,
                     status: status)
    }
}
