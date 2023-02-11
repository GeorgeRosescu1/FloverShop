//
//  OrderCell.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

struct OrderCell: View {
    let order: Order

    var body: some View {
        HStack {
            Text(order.description)
            Spacer()
        }
        .background {
            Color.white
        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: Order(id: 1, description: "floarea soarelui", price: 60, imageURL: "", status: .pending))
    }
}
