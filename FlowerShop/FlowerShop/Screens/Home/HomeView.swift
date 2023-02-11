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
        ZStack {
            Color.wolfWhite
                .ignoresSafeArea()
            VStack {
                ScrollView(showsIndicators: false) {
                    HStack {
                        Text("Comenzi")
                            .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.title))
                            .padding(.top, Constants.defaultPadding)
                        Spacer()
                    }

                    VStack {
                        ForEach(viewModel.state.orders) { order in
                            OrderCell(order: order)
                                .padding(.bottom, Constants.defaultPadding)
                        }
                    }
                    .padding(.top, 40)
                }
                .padding(.horizontal, Constants.defaultPadding)
            }
        }
        .onAppear {
            viewModel.intent(.load)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
