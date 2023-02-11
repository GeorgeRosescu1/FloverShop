//
//  OurCustomersViewModel.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

extension OurCustomersViewModel {
    struct State {
        var customers: [CustomerDTO]
    }

    enum Intent {
        case fetchCustomers
    }
}

final class OurCustomersViewModel: ViewModel {
    @Published private(set) var state: State


    init() {
        self.state = State(customers: [])
    }

    func intent(_ intent: Intent) {
        switch intent {
        case .fetchCustomers:
            Task {
                let customersDTOs: [CustomerDTO] = try! await  ApiService.request("customers", httpMethod: .get)

                await MainActor.run {
                    state.customers = customersDTOs
                }
            }
        }
    }
}
