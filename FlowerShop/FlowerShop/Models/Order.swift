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

        var description: String {
            switch self {
            case .delivered:
                return "Order delivered"
            case .pending:
                return "Order pending"
            case .new:
                return "New order"
            }
        }

        var isDelivered: Bool {
            self == .delivered
        }
    }
}
