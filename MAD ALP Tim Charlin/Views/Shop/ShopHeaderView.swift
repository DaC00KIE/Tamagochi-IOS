//
//  ShopHeaderView.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 06/06/24.
//

import SwiftUI

struct ShopHeaderView: View {
    var coins: Int
    
    var body: some View {
        VStack {
            Text("Shop")
                .font(.title)
            Text("Coins: \(coins)")
                .font(.title)
                .padding()
        }
    }
}
