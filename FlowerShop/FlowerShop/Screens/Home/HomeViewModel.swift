//
//  HomeViewModel.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

extension HomeViewModel {
    struct State {

    }

    enum Intent {

    }
}

final class HomeViewModel: ViewModel {
    @Published private(set) var state: State

    init() {
        self.state = State()
    }

    func intent(_ intent: Intent) {

    }
}
