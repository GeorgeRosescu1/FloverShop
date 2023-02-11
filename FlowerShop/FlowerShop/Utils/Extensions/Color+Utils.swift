//
//  Color+Utils.swift
//  FlowerShop
//
//  Created by George Rosescu on 11.02.2023.
//

import SwiftUI

extension Color {

    static var wolfPink: Color {
        Color("WolfPink")
    }

    static var wolfWhite: Color {
        Color("WolfWhite")
    }

    static var wolfGreen: Color {
        Color("WolfGreen")
    }

    static var wolfBlue: Color {
        Color("WolfBlue")
    }

    static var wolfYellow: Color {
        Color("WolfYellow")
    }

    static var wolfBlack: Color {
        Color("WolfBlack")
    }

    static func colorForStatus(_ status: OrderStatus) -> Color {
        switch status {
        case .delivered:
            return .wolfGreen
        case .pending:
            return .wolfYellow
        case .new:
            return .wolfBlue
        }
    }
}
