//
//  Upgrade View.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 30/05/24.
//

import SwiftUI

struct UpgradeItem : Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var cost: Int
    var statKeyPath: ReferenceWritableKeyPath<Tamagochi, Stat>
    var type: UpgradeType
}

enum UpgradeType: String {
    case capacity = "Capacity"
    case action = "Action"
    case timer = "Timer"
}

struct ShopView: View {
    @ObservedObject var tamagotchi: Tamagochi
    
    @State private var selectedShop: String = "Upgrade"
    
    let upgradeItems: [UpgradeItem] = [
        UpgradeItem(name: "Increase Hunger Max",
                    description: "Boosts the pet's maximum hunger capacity, allowing it to stay satisfied for longer periods.",
                    imageName: "hunger",
                    cost: 200,
                    statKeyPath: \.hunger,
                    type: .capacity),
        
        UpgradeItem(name: "Increase Feed Gains",
                    description: "Enhances the effectiveness of feeding, increasing the amount of hunger satisfaction gained from each feeding.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.hunger,
                    type: .action),
        
        UpgradeItem(name: "Increase Hunger Resistance",
                    description: "Improves the pet's resistance to hunger, decreasing the rate at which it becomes hungry.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.hunger,
                    type: .timer),
        
        UpgradeItem(name: "Increase Cleanliness Max",
                    description: "Expands the pet's maximum cleanliness capacity, allowing it to stay clean for longer durations.",
                    imageName: "cleanliness",
                    cost: 200,
                    statKeyPath: \.cleanliness,
                    type: .capacity),
        
        UpgradeItem(name: "Increase Clean Gains",
                    description: "Increases the amount of cleanliness restored when the pet is cleaned, making each cleaning session more effective.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.cleanliness,
                    type: .action),
        
        UpgradeItem(name: "Increase Clean Resistance",
                    description: "Boosts the pet's resistance to becoming dirty, reducing the frequency of cleanliness deterioration.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.cleanliness,
                    type: .timer),
        
        UpgradeItem(name: "Increase Fun Max",
                    description: "Raises the pet's maximum fun capacity, allowing it to stay entertained for longer periods.",
                    imageName: "fun",
                    cost: 200,
                    statKeyPath: \.fun,
                    type: .capacity),
        
        UpgradeItem(name: "Increase Play Gains",
                    description: "Enhances the amount of fun gained from playing with the pet, making each play session more enjoyable.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.fun,
                    type: .action),
        
        UpgradeItem(name: "Increase Fun Resistance",
                    description: "Improves the pet's resistance to boredom, decreasing the rate at which it loses fun.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.fun,
                    type: .timer),
        
        UpgradeItem(name: "Increase Energy Max",
                    description: "Increases the pet's maximum energy capacity, enabling it to stay active for longer periods.",
                    imageName: "energy",
                    cost: 200,
                    statKeyPath: \.energy,
                    type: .capacity),
        
        UpgradeItem(name: "Increase Rest Gains",
                    description: "Boosts the amount of energy restored when the pet rests, making each rest period more rejuvenating.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.energy,
                    type: .action),
        
        UpgradeItem(name: "Increase Energy Resistance",
                    description: "Enhances the pet's resistance to fatigue, reducing the rate at which it loses energy.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.energy,
                    type: .timer)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ShopHeaderView(coins: tamagotchi.coins)
                ShopSelectionView(selectedShop: $selectedShop)
                if selectedShop == "Upgrade" {
                    UpgradeView(tamagotchi: tamagotchi, upgradeItems: upgradeItems)
                } else if selectedShop == "Accessories" {
                    AccessoriesView(tamagotchi: tamagotchi)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return ShopView(tamagotchi: tamagochi)
}
