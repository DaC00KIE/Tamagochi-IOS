//
//  Upgrade View.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 30/05/24.
//

import SwiftUI

struct UpgradeItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let cost: Int
    let statKeyPath: ReferenceWritableKeyPath<Tamagochi, Stat>
    let type: String
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
                    type: "Capacity"),
        
        UpgradeItem(name: "Increase Feed Gains",
                    description: "Enhances the effectiveness of feeding, increasing the amount of hunger satisfaction gained from each feeding.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.fun,
                    type: "Action"),
        
        UpgradeItem(name: "Increase Hunger Resistance",
                    description: "Improves the pet's resistance to hunger, decreasing the rate at which it becomes hungry.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.energy,
                    type: "Timer"),
        
        UpgradeItem(name: "Increase Cleanliness Max",
                    description: "Expands the pet's maximum cleanliness capacity, allowing it to stay clean for longer durations.",
                    imageName: "cleanliness",
                    cost: 300,
                    statKeyPath: \.cleanliness,
                    type: "Capacity"),
        
        UpgradeItem(name: "Increase Clean Gains",
                    description: "Increases the amount of cleanliness restored when the pet is cleaned, making each cleaning session more effective.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.fun,
                    type: "Action"),
        
        UpgradeItem(name: "Increase Clean Resistance",
                    description: "Boosts the pet's resistance to becoming dirty, reducing the frequency of cleanliness deterioration.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.energy,
                    type: "Timer"),
        
        UpgradeItem(name: "Increase Fun Max",
                    description: "Raises the pet's maximum fun capacity, allowing it to stay entertained for longer periods.",
                    imageName: "fun",
                    cost: 400,
                    statKeyPath: \.fun,
                    type: "Capacity"),
        
        UpgradeItem(name: "Increase Play Gains",
                    description: "Enhances the amount of fun gained from playing with the pet, making each play session more enjoyable.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.fun,
                    type: "Action"),
        
        UpgradeItem(name: "Increase Fun Resistance",
                    description: "Improves the pet's resistance to boredom, decreasing the rate at which it loses fun.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.energy,
                    type: "Timer"),
        
        UpgradeItem(name: "Increase Energy Max",
                    description: "Increases the pet's maximum energy capacity, enabling it to stay active for longer periods.",
                    imageName: "energy",
                    cost: 500,
                    statKeyPath: \.energy,
                    type: "Capacity"),
        
        UpgradeItem(name: "Increase Rest Gains",
                    description: "Boosts the amount of energy restored when the pet rests, making each rest period more rejuvenating.",
                    imageName: "feed",
                    cost: 400,
                    statKeyPath: \.fun,
                    type: "Action"),
        
        UpgradeItem(name: "Increase Energy Resistance",
                    description: "Enhances the pet's resistance to fatigue, reducing the rate at which it loses energy.",
                    imageName: "hunger",
                    cost: 500,
                    statKeyPath: \.energy,
                    type: "Timer")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Shop")
                    .font(.title)
                Text("Coins: \(tamagotchi.coins)")
                    .font(.title)
                    .padding()
                
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
                
                if selectedShop == "Upgrade" {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(upgradeItems) { item in
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
                                                tamagotchi.buyUpgrade(stat: item.statKeyPath, cost: item.cost, increaseAmount: 200,  type: item.type)
                                                SoundManager.inst.play(sound: .Complete)
                                            }) {
                                                Text("Level: \(item.statKeyPath == \.hunger ? tamagotchi.hunger.max_lvl : item.statKeyPath == \.cleanliness ? tamagotchi.cleanliness.max_lvl : item.statKeyPath == \.fun ? tamagotchi.fun.max_lvl : tamagotchi.energy.max_lvl)")
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
                        }
                        .padding()
                    }
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
