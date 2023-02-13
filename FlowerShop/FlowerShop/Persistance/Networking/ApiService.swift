//
//  ApiService.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import Foundation

struct ApiService {
   private static let baseURL = "https://demo1029253.mockable.io/"

    static func request<T: Decodable>(config: NetworkingConfig) async throws -> T {
        let url = URL(string: baseURL + config.path)!

        var request = URLRequest(url: url)
        request.httpMethod = config.httpMthod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)

        let response = try JSONDecoder().decode(T.self, from: data)
        return response
    }
}
