//
//  NetworkingConfig.swift
//  FlowerShop
//
//  Created by George Rosescu on 13.02.2023.
//

import Foundation

protocol NetworkingConfig {
    var path: String { get }
    var httpMthod: HttpMethod { get }
}

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}
