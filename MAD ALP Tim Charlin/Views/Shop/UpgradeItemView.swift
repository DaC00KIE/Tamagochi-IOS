//
//  UpgradeItemView.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 06/06/24.
//

import SwiftUI

struct UpgradeItemView: View {
    @ObservedObject var tamagotchi: Tamagochi
    let item: UpgradeItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.description)
                        .font(.subheadline)
                }
                VStack {
                    Button(action: {
                        tamagotchi.buyUpgrade(stat: item.statKeyPath, cost: item.cost, increaseAmount: 1, type: item.type.rawValue)
                    }) {
                        Text("Level: \(getLevel(for: item))")
                            .padding()
                            .background(tamagotchi.coins >= item.cost ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(tamagotchi.coins < item.cost)
                    Spacer()
                    Text("\(item.cost) Coins")
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    private func getLevel(for item: UpgradeItem) -> Int {
        switch item.type {
        case .capacity:
            return tamagotchi[keyPath: item.statKeyPath].max_lvl
        case .action:
            return tamagotchi[keyPath: item.statKeyPath].increase_lvl
        case .timer:
            return tamagotchi[keyPath: item.statKeyPath].reduction_lvl
        }
    }
}
