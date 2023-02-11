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
                VStack(alignment: .leading) {
                    Text(order.description)
                        .font(.custom(Constants.Fonts.bold,
                                      size: Constants.Fonts.body))

                        .padding(.top, Constants.defaultPadding)
                    Text(order.status.description)
                        .font(.custom(Constants.Fonts.semiBold,
                                      size: Constants.Fonts.caption))
                        .foregroundColor(Color.colorForStatus(order.status))
                    Spacer()
                }
                .padding(.horizontal, Constants.smallPadding)
                Spacer()
                KFImage(URL(string: order.imageURL))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Constants.defaultCornerRadius)
                    .padding(.horizontal, Constants.smallPadding)
                    .padding(.vertical, Constants.extraSmallPadding)
            }
        }
        .frame(height: 150)
        .cornerRadius(Constants.defaultCornerRadius)
    }
}

// MARK: - Preview
struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: OrderWithCustomer(id: 1,
                               description: "floarea soarelui",
                               price: 60,
                                           customer: Customer(id: 1, name: "Marinel", latitude: 46.23, longitude: 23.61),
                               imageURL: "https://firebasestorage.googleapis.com/v0/b/bookml.appspot.com/o/flower1.jpg?alt=media&token=8b196de2-1b97-4989-82e6-89b68bca7845",
                               status: .pending))
    }
}
