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
    let increaseAmount: Int
}

struct AccessoryItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let cost: Int
    let type: AccessoryType
    
    enum AccessoryType {
        case face
        case hat
    }
}

struct ShopView: View {
    @ObservedObject var tamagotchi: Tamagochi
    
    @State private var selectedShop: String = "Upgrade"
    
    let upgradeItems: [UpgradeItem] = [
        UpgradeItem(name: "Increase Hunger Max", description: "Increase the maximum hunger capacity.", imageName: "hunger", cost: 200, statKeyPath: \.hunger, increaseAmount: 600),
        UpgradeItem(name: "Increase Cleanliness Max", description: "Increase the maximum cleanliness capacity.", imageName: "cleanliness", cost: 300, statKeyPath: \.cleanliness, increaseAmount: 600),
        UpgradeItem(name: "Increase Fun Max", description: "Increase the maximum fun capacity.", imageName: "fun", cost: 400, statKeyPath: \.fun, increaseAmount: 600),
        UpgradeItem(name: "Increase Energy Max", description: "Increase the maximum energy capacity.", imageName: "energy", cost: 500, statKeyPath: \.energy, increaseAmount: 600)
    ]
    
    let accessories: [AccessoryItem] = [
        AccessoryItem(name: "Christmas Hat", imageName: "hat_christmas", cost: 200, type: .hat),
        AccessoryItem(name: "Mexican Hat", imageName: "hat_mexican", cost: 150, type: .hat),
        AccessoryItem(name: "Confused Face", imageName: "face_confused", cost: 75, type: .face),
        AccessoryItem(name: "Creeper Face", imageName: "face_creeper", cost: 100, type: .face)
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
                                                tamagotchi.buyUpgrade(stat: item.statKeyPath, cost: item.cost, increaseAmount: item.increaseAmount)
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
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                            ForEach(accessories) { accessory in
                                VStack {
                                    Text(accessory.name)
                                    Image(accessory.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                    Spacer()
                                    Button(action: {
                                        if tamagotchi.coins >= accessory.cost {
                                            tamagotchi.coins -= accessory.cost
                                            if accessory.type == .face {
                                                tamagotchi.purchasedFaces.append(accessory.imageName)
                                            } else if accessory.type == .hat {
                                                tamagotchi.purchasedHats.append(accessory.imageName)
                                            }
                                        }
                                    }) {
                                        Text(tamagotchi.purchasedFaces.contains(accessory.imageName) || tamagotchi.purchasedHats.contains(accessory.imageName) ? "Owned" : "\(accessory.cost) Coins")
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 10)
                                            .background(tamagotchi.purchasedFaces.contains(accessory.imageName) || tamagotchi.purchasedHats.contains(accessory.imageName) ? Color.green : (tamagotchi.coins >= accessory.cost ? Color.blue : Color.gray))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    .disabled(tamagotchi.coins < accessory.cost || tamagotchi.purchasedFaces.contains(accessory.imageName) || tamagotchi.purchasedHats.contains(accessory.imageName))
                                }
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
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
