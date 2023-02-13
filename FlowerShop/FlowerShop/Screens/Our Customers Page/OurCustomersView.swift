//
//  OurCustomersView.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

struct OurCustomersView: View {
    @StateObject private var viewModel = OurCustomersViewModel()
    let customers: [Customer]

    var body: some View {
        ZStack {
            DefaultBackground()
            VStack {
                CustomNavigationBar(title: "Our customers")
                Spacer()
                ScrollView(showsIndicators: false) {
                    content
                }
                .padding(.top, Constants.defaultPadding)
            }
            .padding(.horizontal, Constants.defaultPadding)
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private var content: some View {
        VStack {
            ForEach(customers) { customer in
                CustomerCell(customer: customer, distanceText: viewModel.state.getDistance(for: customer))
            }
        }
    }
}

// MARK: - Preview
struct OurCustomersView_Previews: PreviewProvider {
    static var previews: some View {
        OurCustomersView(customers: [.init(id: 1, name: "Marinel", latitude: 46.23, longitude: 23.12)])
    }
}
