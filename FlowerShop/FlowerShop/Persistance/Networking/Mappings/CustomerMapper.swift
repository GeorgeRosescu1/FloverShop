//
//  CustomerMapper.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

struct CustomerMapper: Mapper {

    static func map(from dto: CustomerDTO) -> Customer? {
        Customer(id: dto.id,
                 name: dto.name,
                 latitude: dto.latitude,
                 longitude: dto.longitude)
    }
}
