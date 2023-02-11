//
//  Order.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

struct Order: Identifiable {
    let id: Int
    let description: String
    let price: Int
    let imageURL: String
    let status: Status
}

extension Order {
    enum Status: String {
        case delivered
        case pending
        case new
    }
}
