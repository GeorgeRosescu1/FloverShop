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
        // Get orders from realm
        let realmOrders = RealmService.getAllOrders()

        if !realmOrders.isEmpty {
            // if there are orders in the local DB pass them ahead
            return realmOrders.compactMap { OrderRealmMapper.map(from: $0) }
        } else {
            // if there are no orders in local DB fetch them from API
            let orderDTOs: [OrderDTO] = try await ApiService.request("orders",
                                                                     httpMethod: .get)

            // Map api DTOs to Realm DTOs and save them locally
            let realmOrdersDTOs: [OrderRealmDTO] = orderDTOs.map {
                OrderRealmDTO(id: $0.id,
                              orderDescription: $0.description,
                              price: $0.price,
                              customerId: $0.customerId,
                              imageURL: $0.imageURL,
                              status: $0.status)
            }

            RealmService.saveOrders(realmOrdersDTOs)

            // return business model
            return orderDTOs.compactMap { OrderMapper.map(from: $0) }
        }
    }

    func fetchCustomers() async throws -> [Customer] {
        let realmCustomers = RealmService.getAllCustomers()

        if !realmCustomers.isEmpty {

            return realmCustomers.compactMap { CustomerRealmMapper.map(from: $0) }
        } else {
            let customerDTOs: [CustomerDTO] = try await ApiService.request("customers",
                                                                           httpMethod: .get)

            let realmCustomersDTOs: [CustomerRealmDTO] = customerDTOs.map {
                CustomerRealmDTO(id: $0.id,
                                 name: $0.name,
                                 latitude: $0.latitude,
                                 longitude: $0.longitude)
            }

            RealmService.saveCustomers(realmCustomersDTOs)

            return customerDTOs.compactMap { CustomerMapper.map(from: $0) }
        }
    }
}
