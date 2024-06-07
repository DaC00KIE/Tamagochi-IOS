//
//  AccessoriesView.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 05/06/24.
//

import SwiftUI

struct accessoryItem: Identifiable {
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

struct AccessoriesView: View {
    @ObservedObject var tamagotchi: Tamagochi
    
    let accessories: [accessoryItem] = [
        accessoryItem(name: "Christmas Hat", imageName: "hat_christmas", cost: 200, type: .hat),
        accessoryItem(name: "Mexican Hat", imageName: "hat_mexican", cost: 150, type: .hat),
        accessoryItem(name: "Confused Face", imageName: "face_confused", cost: 75, type: .face),
        accessoryItem(name: "Creeper Face", imageName: "face_creeper", cost: 100, type: .face),
        accessoryItem(name: "Derpy Face", imageName: "face_derpy", cost: 150, type: .face),
        accessoryItem(name: "Happy Face", imageName: "face_happy", cost: 75, type: .face),
        accessoryItem(name: "Wooper Face", imageName: "face_wooper", cost: 200, type: .face),
    ]
    
    var body: some View {
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
                                SoundManager.inst.play(sound: .Complete)
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
