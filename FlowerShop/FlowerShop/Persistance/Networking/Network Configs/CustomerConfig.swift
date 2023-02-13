//
//  CustomerConfig.swift
//  FlowerShop
//
//  Created by George Rosescu on 13.02.2023.
//

import Foundation


enum CustomerConfig: NetworkingConfig {
    case getAllCustomers

    var path: String {
        switch self {
        case .getAllCustomers:
            return "customers"
        }
    }

    var httpMthod: HttpMethod {
        switch self {
        case .getAllCustomers:
            return .get
        }
    }
}
