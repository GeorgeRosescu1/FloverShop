//
//  OrderDetails.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI
import Kingfisher

struct OrderDetails: View {
    @State private var ostatus: OrderStatus = .new
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

                    descriptionAndStatusStack
                    VStack(alignment: .leading, spacing: Constants.smallPadding) {
                        detailLabel(text: "Cost: \(order.price) RON",
                                    imageSystemName: "bitcoinsign.circle")
                        detailLabel(text: "Ordered by: \(order.customer.name)",
                                    imageSystemName: "person.circle")
                    }
                    .padding(.top, Constants.defaultPadding)


                    CustomSegmentView(selection: $ostatus, values: OrderStatus.allCases)
                }
                .padding(.top, Constants.defaultPadding)
                Spacer()
            }
            .padding(.horizontal, Constants.defaultPadding)
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    // MARK: - Description and status stack
    private var descriptionAndStatusStack: some View {
        VStack(alignment: .leading) {
            Text(order.description)
                .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.title))
                .foregroundColor(.wolfBlack)

            Text(order.status.description)
                .font(.custom(Constants.Fonts.semiBold,
                              size: Constants.Fonts.smallBody))
                .foregroundColor(.colorForStatus(order.status))
        }
    }

    // MARK: - Details label
    private func detailLabel(text: String, imageSystemName: String) -> some View {
        HStack {
            Image(systemName: imageSystemName)
                .font(.custom(Constants.Fonts.regular,
                              size: Constants.Fonts.body))
            Text(text)
                .font(.custom(Constants.Fonts.regular,
                              size: Constants.Fonts.smallBody))
        }
        .foregroundColor(.wolfBlack)
    }
}

// MARK: - Preview
struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails(order: OrderWithCustomer(id: 1, description: "Flower Power", price: 45, customer: Customer(id: 1, name: "Sumudica", latitude: 45.90, longitude: 23.90), imageURL: "https://firebasestorage.googleapis.com/v0/b/bookml.appspot.com/o/flower3.jpg?alt=media&token=b6abacc7-96bc-48a3-a7c4-b73c7bc25f7f", status: .pending))
    }
}
