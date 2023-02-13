//
//  OrderConfig.swift
//  FlowerShop
//
//  Created by George Rosescu on 13.02.2023.
//

import Foundation

enum OrderConfig: NetworkingConfig {
    case getAllOrders

    var path: String {
        switch self {
        case .getAllOrders:
            return "orders"
        }
    }

    var httpMthod: HttpMethod {
        switch self {
        case .getAllOrders:
            return .get
        }
    }
}
