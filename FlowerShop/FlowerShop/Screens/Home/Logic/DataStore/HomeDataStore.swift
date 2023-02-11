//
//  HomeDataStore.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

protocol HomeDataStore {
    func fetchOrders() async throws -> [Order]
    func fetchCustomers() async throws -> [Customer]
}

struct HomeDataStoreImpl: HomeDataStore {

    func fetchOrders() async throws -> [Order] {
        let orderDTOs: [OrderDTO] = try await ApiService.request("orders",
                                                                 httpMethod: .get)

        return orderDTOs.compactMap { OrderMapper.map(from: $0) }
    }

    func fetchCustomers() async throws -> [Customer] {
        let customerDTOs: [CustomerDTO] = try await ApiService.request("customers",
                                                                       httpMethod: .get)

        return customerDTOs.compactMap { CustomerMapper.map(from: $0) }
    }
}
