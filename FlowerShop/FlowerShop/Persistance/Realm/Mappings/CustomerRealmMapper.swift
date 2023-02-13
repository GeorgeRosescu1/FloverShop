//
//  CustomerRealmMapper.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import Foundation

struct CustomerRealmMapper: Mapper {

    static func map(from dto: CustomerRealmDTO) -> Customer? {
        Customer(id: dto.id,
                 name: dto.name,
                 latitude: dto.latitude,
                 longitude: dto.longitude)
    }
}
