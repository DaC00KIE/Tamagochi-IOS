//
//  UpgradeItemsView.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 06/06/24.
//

import SwiftUI

struct UpgradeView: View {
    @ObservedObject var tamagotchi: Tamagochi
    let upgradeItems: [UpgradeItem]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(upgradeItems) { item in
                    UpgradeItemView(tamagotchi: tamagotchi, item: item)
                }
            }
            .padding()
        }
    }
}
