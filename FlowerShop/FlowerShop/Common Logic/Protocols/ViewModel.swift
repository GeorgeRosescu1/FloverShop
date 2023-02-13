//
//  ViewModel.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

/// Any view model should adopt this protocol
protocol ViewModel: ObservableObject {
    /// The associated state
    associatedtype State
    /// The associated intent
    associatedtype Intent

    /// State represents the single source of truth that the view model has
    var state: State { get }

    /// Any view model shoud have an intent method with a finite amount of intents
    /// this is the only way to modify values inside the view model
    /// - Parameter intent: The intent that is triggered
    func intent(_ intent: Intent)
}
