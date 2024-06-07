//
//  AccessoriesView.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 05/06/24.
//
import SwiftUI

struct AccessoryItem: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var cost: Int
    var type: AccessoryType
}

enum AccessoryType {
    case hat
    case face
}

struct AccessoriesView: View {
    @ObservedObject var tamagotchi: Tamagochi
    
    let accessories: [AccessoryItem] = [
        AccessoryItem(name: "Christmas Hat", imageName: "hat_christmas", cost: 200, type: .hat),
        AccessoryItem(name: "Mexican Hat", imageName: "hat_mexican", cost: 150, type: .hat),
        AccessoryItem(name: "Confused Face", imageName: "face_confused", cost: 75, type: .face),
        AccessoryItem(name: "Creeper Face", imageName: "face_creeper", cost: 100, type: .face),
        AccessoryItem(name: "Derpy Face", imageName: "face_derpy", cost: 150, type: .face),
        AccessoryItem(name: "Happy Face", imageName: "face_happy", cost: 75, type: .face),
        AccessoryItem(name: "Wooper Face", imageName: "face_wooper", cost: 200, type: .face),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 150, maximum: 200), spacing: 20), GridItem(.flexible(minimum: 150, maximum: 200), spacing: 20)], spacing: 20) {
                ForEach(accessories) { accessory in
                    VStack {
                        Text(accessory.name)
                        Image("\(accessory.imageName)_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
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

struct AccessoriesView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoriesView(tamagotchi: Tamagochi())
    }
}
