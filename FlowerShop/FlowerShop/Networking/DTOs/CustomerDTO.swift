//
//  CustomerDTO.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

struct CustomerDTO: Decodable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
}
