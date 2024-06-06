//
//  ShopSelectionView.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 06/06/24.
//

import Foundation
import SwiftUI

struct ShopSelectionView: View {
    @Binding var selectedShop: String
    
    var body: some View {
        HStack {
            Button(action: {
                selectedShop = "Upgrade"
            }) {
                Text("Upgrade")
                    .padding()
                    .background(selectedShop == "Upgrade" ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                selectedShop = "Accessories"
            }) {
                Text("Accessories")
                    .padding()
                    .background(selectedShop == "Accessories" ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
