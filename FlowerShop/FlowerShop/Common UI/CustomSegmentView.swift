//
//  CustomSegmentView.swift
//  FlowerShop
//
//  Created by George Rosescu on 12.02.2023.
//

import SwiftUI

struct CustomSegmentView<T: Segmentable>: View {
    @Binding var selection: T
    let values: [T]

    var body: some View {
        HStack {
            ForEach(values) { value in
                Button {
                    withAnimation(.easeIn) { selection = value }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(selection == value ? .wolfPink : .wolfWhite)
                        Text(value.title)
                            .font(.custom(Constants.Fonts.bold, size: Constants.Fonts.caption))
                            .foregroundColor(selection == value ? .wolfWhite : .wolfBlack)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
    }
}

struct CustomSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentView(selection: .constant(OrderStatus.new), values: OrderStatus.allCases)
    }
}
