//
//  HomeView.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel(dataStore: HomeDataStoreImpl())

    var body: some View {
        NavigationStack {
            ZStack {
                Color.wolfWhite.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    content
                        .padding(.horizontal, Constants.defaultPadding)
                }
            }
            .onAppear {
                if viewModel.state.ordersWithCustomers.isEmpty {
                    viewModel.intent(.load)
                }
            }
        }
    }

    private var content: some View {
        VStack {
            HStack {
                Text("Comenzi")
                    .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.title))
                Spacer()
                NavigationLink {
                    OurCustomersView(customers: viewModel.state.customers)
                } label: {
                    Image.customers
                        .foregroundColor(.wolfPink)
                        .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.body))
                        .frame(width: 40, height: 40)
                        .background { Color.white }
                        .cornerRadius(5)
                }
            }
            .padding(.top, Constants.defaultPadding)

            VStack {
                ForEach(viewModel.state.ordersWithCustomers) { order in
                    NavigationLink {
                        OrderDetails(orderStatus: Binding(get: { order.status },
                                                          set: { viewModel.intent(.changeOrderStatus(order.id, $0) )}),
                                     order: order)
                    } label: {
                        OrderCell(order: order)
                    }
                    .padding(.bottom, Constants.smallPadding)
                }
            }
            .padding(.top, Constants.defaultPadding)
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
