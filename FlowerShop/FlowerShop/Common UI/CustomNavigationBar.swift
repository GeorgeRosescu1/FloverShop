//
//  CustomNavigationBar.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.dismiss) var dismiss
    let title: String?

    init(title: String? = nil) {
        self.title = title
    }

    var body: some View {
        HStack {
            Button {
                dismiss.callAsFunction()
            } label: {
                Image.back
                    .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.smallBody))
                    .foregroundColor(.wolfBlack)
            }
            Spacer()
            if let title {
                Text(title)
                    .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.smallBody))
                    .foregroundColor(.wolfBlack)
            }
            Spacer()
        }
    }
}

// MARK: - Preview

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
