//
//  OrderStatsView.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import SwiftUI

struct OrderStatsView: View {
    let newNumber: Int
    let pendingNumber: Int
    let deliveredNumber: Int

    var body: some View {
        ZStack {
            Color.white
            HStack {
                statView(newNumber, for: "New")
                    .foregroundColor(.wolfBlue)
                    .frame(maxWidth: .infinity)

                statView(pendingNumber, for: "Pending")
                    .foregroundColor(.wolfYellow)
                    .frame(maxWidth: .infinity)

                statView(deliveredNumber, for: "Delivered")
                    .foregroundColor(.wolfGreen)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .cornerRadius(Constants.defaultCornerRadius)
    }

    private func statView(_ stat: Int, for metric: String) -> some View {
        VStack {
            Text("\(stat)")
            Text(metric)
        }
        .font(.custom(Constants.Fonts.semiBold, size: Constants.Fonts.body))
    }
}

// MARK: - Preview
struct OrderStatsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderStatsView(newNumber: 5, pendingNumber: 3, deliveredNumber: 4)
    }
}
