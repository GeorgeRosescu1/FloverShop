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
    let distanceText: String

    var body: some View {
        ZStack {
            Color.white
            HStack {
                textsContainer
                    .padding(Constants.smallPadding)
                Spacer()
            }
        }
        .cornerRadius(Constants.defaultCornerRadius)
    }

    private var textsContainer: some View {
        VStack(alignment: .leading, spacing: Constants.extraSmallPadding) {
            Text(customer.name)
                .font(.custom(Constants.Fonts.bold,
                              size: Constants.Fonts.body))
                .foregroundColor(.wolfPink)

            Text(distanceText)
                .font(.custom(Constants.Fonts.semiBold,
                              size: Constants.Fonts.caption))
                .foregroundColor(.wolfBlack)

        }
    }
}

// MARK: - Preview

struct CustomerCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomerCell(customer: Customer(id: 1, name: "Marinel", latitude: 46.7716, longitude: 23.6010), distanceText: "2 km")
    }
}
