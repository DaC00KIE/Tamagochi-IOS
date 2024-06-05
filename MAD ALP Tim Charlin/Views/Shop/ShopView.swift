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
//    let effect: (ProgressViewModel) -> Void
}

struct ShopView: View {
    @State var tamagochi: Tamagochi
    @State private var coins: Int = 10000
    @State private var isClickedToBack: Bool = false
    
//    @State private var upgradeItems: [UpgradeItem] = [
//        UpgradeItem(name: "Speed Boost", cost: 200, effect: { $0.maxHunger += 90 }),
//        UpgradeItem(name: "Double Points", cost: 300, effect: { $0.maxCleanliness += 90 }),
//        UpgradeItem(name: "Extra Life", cost: 400, effect: { $0.maxHappiness += 90 }),
//        UpgradeItem(name: "Invincibility", cost: 500, effect: { $0.maxEnergy += 90 })
//    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Coins: \(coins)")
                    .font(.title)
                    .padding()

//                ScrollView {
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                        ForEach(upgradeItems) { item in
//                            VStack {
//                                Text(item.name)
//                                    .font(.headline)
//                                Text("\(item.cost) Coins")
//                                    .font(.subheadline)
//                                Button(action: {
//                                    if coins >= item.cost {
//                                        coins -= item.cost
//                                    }
//                                }) {
//                                    Text("Buy")
//                                        .padding()
//                                        .background(Color.blue)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(10)
//                                }
//                                .disabled(coins < item.cost)
//                            }
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                        }
//                    }
//                    .padding()
//                }
//                .navigationTitle("Shop - Upgrade")
//                .padding()
                
                Text("Back")
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.isClickedToBack = true
                    }
                    .fullScreenCover(isPresented: $isClickedToBack) {
                        ProgressView(tamagochi: tamagochi)
                    }
            }
        }
    }
}

struct Content_View: View {
    @State var tamagochi: Tamagochi
    
    var body: some View {
        TabView {
            ShopView(tamagochi: tamagochi)
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
    @State var pet = Tamagochi()
    return Content_View(tamagochi: pet)
}
