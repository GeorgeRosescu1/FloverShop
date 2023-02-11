//
//  Array+Utils.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

extension Array where Element == Order {
    var areAllDelivered: Bool {
        self.filter { $0.status.isDelivered }.count == self.count
    }
}
