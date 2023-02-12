//
//  OrderStatus.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

enum OrderStatus: String {
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
