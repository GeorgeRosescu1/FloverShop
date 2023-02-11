//
//  OrderDetails.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

struct OrderDetails: View {
    let order: OrderWithCustomer

    var body: some View {
        ZStack {
            Color.wolfWhite.ignoresSafeArea()
            Text(order.description)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Preview
struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails(order: OrderWithCustomer(id: 1, description: "Flower Power", price: 45, customer: Customer(id: 1, name: "Sumudica", latitude: 45.90, longitude: 23.90), imageURL: "https://firebasestorage.googleapis.com/v0/b/bookml.appspot.com/o/flower1.jpg?alt=media&token=8b196de2-1b97-4989-82e6-89b68bca7845", status: .pending))
    }
}
