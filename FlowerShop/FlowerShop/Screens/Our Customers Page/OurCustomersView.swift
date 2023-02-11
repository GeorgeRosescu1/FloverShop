//
//  OurCustomersView.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

struct OurCustomersView: View {
    @Environment(\.dismiss) var dismiss

    @StateObject private var viewModel = OurCustomersViewModel()

    var body: some View {
        ZStack {
            Color.wolfWhite.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        dismiss.callAsFunction()

                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.body))
                            .foregroundColor(.wolfBlack)
                    }
                    Spacer()
                    Text("Our customers")
                        .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.body))
                        .foregroundColor(.wolfBlack)
                    Spacer()
                }
                Spacer()
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(viewModel.state.customers, id: \.id) { customer in
                            Text(customer.name)
                        }
                    }
                }
            }
            .padding(.horizontal, Constants.defaultPadding)
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            viewModel.intent(.fetchCustomers)
        }
    }
}

// MARK: - Preview
struct OurCustomersView_Previews: PreviewProvider {
    static var previews: some View {
        OurCustomersView()
    }
}
