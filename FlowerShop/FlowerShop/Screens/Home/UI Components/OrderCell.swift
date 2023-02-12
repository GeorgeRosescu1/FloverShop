//
//  OrderCell.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI
import Kingfisher

struct OrderCell: View {
    let order: OrderWithCustomer

    var body: some View {
        ZStack {
            Color.white
            HStack {
                textStack
                    .padding(.horizontal, Constants.smallPadding)
                    .padding(.vertical, Constants.defaultPadding)
                Spacer()
                KFImage(URL(string: order.imageURL))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Constants.defaultCornerRadius)
                    .padding(.trailing, Constants.smallPadding)
                    .padding(.vertical, Constants.extraSmallPadding)
            }
        }
        .frame(height: 150)
        .cornerRadius(Constants.defaultCornerRadius)
    }

    private var textStack: some View {
        VStack(alignment: .leading) {
            Text(order.description)
                .font(.custom(Constants.Fonts.bold,
                              size: Constants.Fonts.body))
                .foregroundColor(.wolfBlack)
                .multilineTextAlignment(.leading)
            Text(order.status.description)
                .font(.custom(Constants.Fonts.semiBold,
                              size: Constants.Fonts.smallBody))
                .foregroundColor(Color.colorForStatus(order.status))
            Spacer()
            Text("Ordered by: \(order.customer.name)")
                .font(.custom(Constants.Fonts.regular,
                              size: Constants.Fonts.caption))
                .foregroundColor(.wolfBlack)
                .multilineTextAlignment(.leading)
        }
    }
}

// MARK: - Preview
struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: OrderWithCustomer(id: 1,
                                           description: "Pack of 30 sun flowers",
                                           price: 60,
                                           customer: Customer(id: 1, name: "Marinel", latitude: 46.23, longitude: 23.61),
                                           imageURL: "https://firebasestorage.googleapis.com/v0/b/bookml.appspot.com/o/flower5.jpg?alt=media&token=3fa34719-e15e-4dd9-98a8-ee096a882ef9",
                                           status: .new))
    }
}
