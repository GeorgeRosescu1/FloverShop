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
                DefaultBackground()
                ScrollView(showsIndicators: false) {
                    content
                        .padding(.horizontal, Constants.defaultPadding)
                }
                .refreshable { viewModel.intent(.refreshOrders) }
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
            titleAndCustomersNavigation
                .padding(.top, Constants.defaultPadding)

            OrderStatsView(newNumber: viewModel.state.newOrdersCount,
                           pendingNumber: viewModel.state.pendingOrdersCount,
                           deliveredNumber: viewModel.state.deliveredOrdersCount)
            .padding(.top, Constants.defaultPadding)

            if viewModel.state.ordersError == nil {
                ordersList
                    .padding(.top, Constants.defaultPadding)
            } else {
                Text("No orders available")
                    .font(.custom(Constants.Fonts.bold,
                                  size: Constants.Fonts.title))
                    .foregroundColor(.wolfBlack)
            }
        }
    }

    private var ordersList: some View {
        VStack {
            HStack {
                Text("All orders")
                    .font(.custom(Constants.Fonts.regular,
                                  size: Constants.Fonts.body))
                Spacer()
            }
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
    }
    
    // MARK: Page title and customers navigation link
    private var titleAndCustomersNavigation: some View {
        HStack {
            Text("Comenzi")
                .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.title))
            Spacer()
            if viewModel.state.customersError == nil {
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
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
