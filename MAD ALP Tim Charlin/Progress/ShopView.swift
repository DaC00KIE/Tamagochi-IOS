//
//  Upgrade View.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 30/05/24.
//

import SwiftUI


class ProgressViewModel: ObservableObject {
    @Published var hunger: Int = 5
    @Published var cleanliness: Int = 5
    @Published var happiness: Int = 5
    @Published var energy: Int = 5
    
    @Published var maxHunger: Int = 10
    @Published var maxCleanliness: Int = 10
    @Published var maxHappiness: Int = 10
    @Published var maxEnergy: Int = 10
}

struct UpgradeItem: Identifiable {
    let id = UUID()
    let name: String
    let cost: Int
    let effect: (ProgressViewModel) -> Void
}

struct ShopView: View {
    @State private var coins: Int = 10000
    @State private var isClickedToBack: Bool = false
    
    @State private var upgradeItems: [UpgradeItem] = [
        UpgradeItem(name: "Speed Boost", cost: 200, effect: { $0.maxHunger += 90 }),
        UpgradeItem(name: "Double Points", cost: 300, effect: { $0.maxCleanliness += 90 }),
        UpgradeItem(name: "Extra Life", cost: 400, effect: { $0.maxHappiness += 90 }),
        UpgradeItem(name: "Invincibility", cost: 500, effect: { $0.maxEnergy += 90 })
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Coins: \(coins)")
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
                                    if coins >= item.cost {
                                        coins -= item.cost
                                    }
                                }) {
                                    Text("Buy")
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .disabled(coins < item.cost)
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
            ShopView()
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
