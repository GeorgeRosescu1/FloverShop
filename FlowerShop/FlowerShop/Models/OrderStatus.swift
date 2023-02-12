//
//  OrderStatus.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

enum OrderStatus: String, Segmentable {
    case new
    case pending
    case delivered

    var id: String {
        self.rawValue
    }

    var title: String {
        switch self {
        case .new:
            return "New"
        case .pending:
            return "Pending"
        case .delivered:
            return "Delivered"
        }
    }

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

protocol Segmentable: Identifiable, Equatable, CaseIterable {
    var title: String { get }
}
