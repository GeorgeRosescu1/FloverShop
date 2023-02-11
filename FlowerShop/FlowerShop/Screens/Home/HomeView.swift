//
//  HomeView.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

struct HomeView: View {
    let orders: [Order] = [Order(id: 1, description: "floare de colr", price: 25, imageURL: "", status: .delivered), Order(id: 2, description: "floarea soarelui", price: 60, imageURL: "", status: .pending)]

    var body: some View {
        ZStack {
            Color.wolfWhite
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    HStack {
                        Text("Comenzi")
                            .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.title))
                            .padding(.top, Constants.defaultPadding)
                        Spacer()
                    }

                    VStack {
                        ForEach(orders) { order in
                            OrderCell(order: order)
                                .padding(.bottom, Constants.defaultPadding)
                        }
                    }
                    .padding(.top, 40)
                }
                .padding(.horizontal, Constants.defaultPadding)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
