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
                Color.wolfWhite
                    .ignoresSafeArea()
                VStack {
                    ScrollView(showsIndicators: false) {
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
                                    OrderDetails(order: order)
                                } label: {
                                    OrderCell(order: order)
                                }
                                .padding(.bottom, Constants.smallPadding)
                            }
                        }
                        .padding(.top, Constants.defaultPadding)
                    }
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
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
