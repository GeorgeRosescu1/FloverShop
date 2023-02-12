//
//  OrderDetails.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI
import Kingfisher

struct OrderDetails: View {
    @Environment(\.dismiss) var dismiss
    let order: OrderWithCustomer

    var body: some View {
        ZStack {
            Color.wolfWhite.ignoresSafeArea()
            VStack {
                CustomNavigationBar()
                VStack(alignment: .leading) {
                    KFImage(URL(string: order.imageURL))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(Constants.defaultCornerRadius)
                        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)

                    Text(order.description)
                        .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.title))
                        .foregroundColor(.wolfBlack)

                    Text(order.status.description)
                        .font(.custom(Constants.Fonts.semiBold,
                                      size: Constants.Fonts.smallBody))
                        .foregroundColor(Color.colorForStatus(order.status))

                    HStack {
                        Image(systemName: "bitcoinsign.circle")
                            .font(.custom(Constants.Fonts.semiBold,
                                          size: Constants.Fonts.body))
                        Text("\(order.price) RON")
                            .font(.custom(Constants.Fonts.semiBold,
                                          size: Constants.Fonts.smallBody))
                    }
                    .foregroundColor(.wolfBlack)
                    .padding(.top, Constants.defaultPadding)

                    HStack {
                        Image(systemName: "person.circle")
                            .font(.custom(Constants.Fonts.semiBold,
                                          size: Constants.Fonts.body))
                        Text("Ordered by: \(order.customer.name)")
                            .font(.custom(Constants.Fonts.semiBold,
                                          size: Constants.Fonts.smallBody))
                    }
                    .foregroundColor(.wolfBlack)
                    .padding(.top, Constants.extraSmallPadding)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, Constants.defaultPadding)
                Spacer()
            }
            .padding(.horizontal, Constants.defaultPadding)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Preview
struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails(order: OrderWithCustomer(id: 1, description: "Flower Power", price: 45, customer: Customer(id: 1, name: "Sumudica", latitude: 45.90, longitude: 23.90), imageURL: "https://firebasestorage.googleapis.com/v0/b/bookml.appspot.com/o/flower3.jpg?alt=media&token=b6abacc7-96bc-48a3-a7c4-b73c7bc25f7f", status: .pending))
    }
}
