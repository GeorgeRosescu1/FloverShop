//
//  CustomerCell.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

struct CustomerCell: View {
    let customer: CustomerDTO

    var body: some View {
        ZStack {
            Color.white
            HStack {
                Text(customer.name)
            }
        }
    }
}

// MARK: - Preview

struct CustomerCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomerCell(customer: CustomerDTO(id: 1, name: "Marinel", latitude: 46.7716, longitude: 23.6010))
    }
}
