//
//  DefaultBackground.swift
//  FlowerShop
//
//  Created by George Rosescu on 13.02.2023.
//

import SwiftUI

struct DefaultBackground: View {
    var body: some View {
        Color.wolfWhite.ignoresSafeArea()
    }
}

// MARK: - Preview
struct DefaultBackground_Previews: PreviewProvider {
    static var previews: some View {
        DefaultBackground()
    }
}
