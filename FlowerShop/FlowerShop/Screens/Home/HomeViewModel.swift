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
        var ordersError: Error?
        var customersError: Error?

        var newOrdersCount: Int {
            ordersWithCustomers.filter { $0.status == .new }.count
        }

        var pendingOrdersCount: Int {
            ordersWithCustomers.filter { $0.status == .pending }.count
        }

        var deliveredOrdersCount: Int {
            ordersWithCustomers.filter { $0.status == .delivered }.count
        }
    }

    enum Intent {
        case load
        case changeOrderStatus(Int, OrderStatus)
        case refreshOrders
    }
}

final class HomeViewModel: ViewModel {
    @Published private(set) var state: State

    private let dataStore: HomeDataStore

    init(dataStore: HomeDataStore) {
        self.state = State(ordersWithCustomers: [],
                           customers: [],
                           ordersError: nil,
                           customersError: nil)
        self.dataStore = dataStore
    }

    func intent(_ intent: Intent) {
        switch intent {
        case .load:
            fetchData()
        case .changeOrderStatus(let orderId, let status):
            changeOrderStatus(orderId: orderId, status: status)
        case .refreshOrders:
            refreshData()
        }
    }

    private func changeOrderStatus(orderId: Int, status: OrderStatus) {
        guard let orderWithCustomer = state.ordersWithCustomers.first(where: { $0.id == orderId }) else {
            return
        }

        let order = Order(id: orderWithCustomer.id,
                          description: orderWithCustomer.description,
                          price: orderWithCustomer.price,
                          customerId: orderWithCustomer.customer.id,
                          imageURL: orderWithCustomer.imageURL,
                          status: status)

        let orders = dataStore.updateOrder(order: order)
        state.ordersWithCustomers = getOrdersWithCustomers(orders: orders, customers: state.customers)
    }

    private func refreshData() {
        Task {
            async let orders = refreshOrders()
            async let customers = refreshCustomers()

            let ordersWithCustomers: [OrderWithCustomer] = getOrdersWithCustomers(orders: await orders, customers: await customers)
            let fetchedCustomers = await customers
            await MainActor.run {
                state.ordersWithCustomers = ordersWithCustomers
                state.customers = fetchedCustomers
            }
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

    private func refreshOrders() async -> [Order] {
        do {
            let orders = try await dataStore.refreshOrders()
            await MainActor.run {
                state.ordersError = nil
            }

            return orders
        } catch {
            await MainActor.run {
                state.ordersError = error
            }
            return []
        }
    }

    private func refreshCustomers() async -> [Customer] {
        do {
            let customers = try await dataStore.refreshCustomers()
            await MainActor.run {
                state.customersError = nil
            }

            return customers
        } catch {
            await MainActor.run {
                state.customersError = error
            }
            return []
        }
    }

    private func fetchOrders() async -> [Order] {
        do {
            let orders = try await dataStore.fetchOrders()
            await MainActor.run {
                state.ordersError = nil
            }

            return orders
        } catch {
            await MainActor.run {
                state.ordersError = error
            }
            return []
        }
    }

    private func fetchCustomers() async -> [Customer] {
        do {
            let customers = try await dataStore.fetchCustomers()
            await MainActor.run {
                state.customersError = nil
            }

            return customers
        } catch {
            await MainActor.run {
                state.customersError = error
            }
            return []
        }
    }
}
