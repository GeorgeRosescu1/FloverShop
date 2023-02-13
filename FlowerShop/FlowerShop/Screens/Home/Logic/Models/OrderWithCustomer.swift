//
//  OrderWithCustomer.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

struct OrderWithCustomer: Identifiable {
    let id: Int
    let description: String
    let price: Int
    let customer: Customer
    let imageURL: String
    let status: OrderStatus
}
