//
//  HomeViewModel.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

extension HomeViewModel {
    struct State {
        var orders: [Order]
    }

    enum Intent {
        case load
    }
}

final class HomeViewModel: ViewModel {
    @Published private(set) var state: State

    private let dataStore: HomeDataStore

    init(dataStore: HomeDataStore) {
        self.state = State(orders: [])
        self.dataStore = dataStore
    }

    func intent(_ intent: Intent) {
        switch intent {
        case .load:
            Task {
                await fetchOrders()
            }
        }
    }

    private func fetchOrders() async {
        do {
            let orders = try await dataStore.fetchOrders()
            await MainActor.run {
                state.orders = orders
            }
        } catch {
            print(error)
        }

    }
}
