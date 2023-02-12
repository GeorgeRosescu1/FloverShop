//
//  HomeViewModel.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

extension HomeViewModel {
    struct State {
        var ordersWithCustomers: [OrderWithCustomer]
        var customers: [Customer]
    }

    enum Intent {
        case load
        case changeOrderStatus(Int, OrderStatus)
    }
}

final class HomeViewModel: ViewModel {
    @Published private(set) var state: State

    private let dataStore: HomeDataStore

    init(dataStore: HomeDataStore) {
        self.state = State(ordersWithCustomers: [], customers: [])
        self.dataStore = dataStore
    }

    func intent(_ intent: Intent) {
        switch intent {
        case .load:
            fetchData()
        case .changeOrderStatus(let orderId, let status):
            let newOrders = state.ordersWithCustomers.map {
                if $0.id == orderId {
                    return OrderWithCustomer(id: $0.id,
                                             description: $0.description,
                                             price: $0.price,
                                             customer: $0.customer,
                                             imageURL: $0.imageURL,
                                             status: status)
                } else {
                    return $0
                }
            }

            state.ordersWithCustomers = newOrders
        }
    }

    private func fetchData() {
        Task {
            async let orders = fetchOrders()
            async let customers = fetchCustomers()

            let ordersWithCustomers: [OrderWithCustomer] = getOrdersWithCustomers(orders: await orders, customers: await customers)
            let fetchedCustomers = await customers
            await MainActor.run {
                state.ordersWithCustomers = ordersWithCustomers
                state.customers = fetchedCustomers
            }
        }
    }

    private func getOrdersWithCustomers(orders: [Order], customers: [Customer]) -> [OrderWithCustomer] {
        orders.compactMap { order in
            guard let customer = customers.first(where: { $0.id == order.customerId }) else {
                // There is no reason to have an order that is for a client that does not exist
                return nil
            }

            return OrderWithCustomer(id: order.id,
                                     description: order.description,
                                     price: order.price,
                                     customer: customer,
                                     imageURL: order.imageURL,
                                     status: order.status)
        }
    }

    private func fetchOrders() async -> [Order] {
        do {
            return try await dataStore.fetchOrders()
        } catch {
            // TODO: add error handeleing
            return []
        }
    }

    private func fetchCustomers() async -> [Customer] {
        do {
            return try await dataStore.fetchCustomers()
        } catch {
            // TODO: add error handeleing
            return []
        }
    }
}
