//
//  Segmentable.swift
//  FlowerShop
//
//  Created by George Rosescu on 13.02.2023.
//

import Foundation

protocol Segmentable: Identifiable, Equatable, CaseIterable {
    var title: String { get }
}
