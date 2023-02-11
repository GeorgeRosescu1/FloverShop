//
//  CustomerCell.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI
import CoreLocation

struct CustomerCell: View {
    let customer: Customer
    let vendorLocation: CLLocation?

    var body: some View {
        ZStack {
            Color.white
            HStack {
                Text(customer.name)
                    .font(.custom(Constants.Fonts.bold,
                                  size: Constants.Fonts.body))
                    .foregroundColor(.wolfBlack)
                if let vendorLocation {
                    Text(String(format: "%.2f", vendorLocation.distance(from: CLLocation(latitude: customer.latitude, longitude: customer.longitude)) / 1000))
                }
                Spacer()
            }
        }
    }
}

// MARK: - Preview

struct CustomerCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomerCell(customer: Customer(id: 1, name: "Marinel", latitude: 46.7716, longitude: 23.6010), vendorLocation: CLLocation(latitude: 46.757919, longitude: 23.546688))
    }
}
