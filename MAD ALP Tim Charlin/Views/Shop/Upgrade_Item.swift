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
    let cost: Int
    let statKeyPath: ReferenceWritableKeyPath<Tamagochi, Stat>
    let increaseAmount: Int
}

struct ShopView: View {
    @ObservedObject var tamagotchi: Tamagochi
    @State private var isClickedToBack: Bool = false
    
    let upgradeItems: [UpgradeItem] = [
        UpgradeItem(name: "Increase Hunger Max", cost: 200, statKeyPath: \.hunger, increaseAmount: 600),
        UpgradeItem(name: "Increase Cleanliness Max", cost: 300, statKeyPath: \.cleanliness, increaseAmount: 600),
        UpgradeItem(name: "Increase Fun Max", cost: 400, statKeyPath: \.fun, increaseAmount: 600),
        UpgradeItem(name: "Increase Energy Max", cost: 500, statKeyPath: \.energy, increaseAmount: 600)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Coins: \(tamagotchi.coins)")
                    .font(.title)
                    .padding()

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(upgradeItems) { item in
                            VStack {
                                Text(item.name)
                                    .font(.headline)
                                Text("\(item.cost) Coins")
                                    .font(.subheadline)
                                Button(action: {
                                    tamagotchi.buyUpgrade(stat: item.statKeyPath, cost: item.cost, increaseAmount: item.increaseAmount)
                                }) {
                                    Text("Buy")
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .disabled(tamagotchi.coins < item.cost)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Shop - Upgrade")
                .padding()
                
                Text("Back")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.isClickedToBack = true
                    }
                    .fullScreenCover(isPresented: $isClickedToBack) {
                        ProgressView()
                    }
            }
        }
    }
}

struct Content_View: View {
    var body: some View {
        TabView {
            ShopView(tamagotchi: Tamagochi())
                .tabItem {
                    Label("Upgrade", systemImage: "arrow.up.circle")
                }
            Text("Accessories Page")
                .tabItem {
                    Label("Accessories", systemImage: "star.circle")
                }
            Text("Gacha Page")
                .tabItem {
                    Label("Gacha", systemImage: "gift.circle")
                }
        }
    }
}

#Preview {
    Content_View()
}
