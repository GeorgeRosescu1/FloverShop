//
//  Mapper.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

protocol Mapper {
    /// The associated dto model
    associatedtype DTOModel
    /// The associated model
    associatedtype Model

    /// Map the associated dto model to the actual model
    /// - Parameter dto: The associated dto model
    static func map(from : DTOModel) -> Model
}
