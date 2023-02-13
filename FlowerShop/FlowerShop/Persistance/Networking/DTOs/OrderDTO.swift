//
//  OrderDTO.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

struct OrderDTO: Decodable {
    let id: Int
    let description: String
    let price: Int
    let customerId: Int
    let imageURL: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id
        case description
        case price
        case customerId = "customer_id"
        case imageURL = "image_url"
        case status
    }
}
