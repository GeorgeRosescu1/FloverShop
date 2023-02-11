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
    let customers: [Customer]

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
                        ForEach(customers) { customer in
                            CustomerCell(customer: customer)
                        }
                    }
                }
            }
            .padding(.horizontal, Constants.defaultPadding)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Preview
struct OurCustomersView_Previews: PreviewProvider {
    static var previews: some View {
        OurCustomersView(customers: [])
    }
}
