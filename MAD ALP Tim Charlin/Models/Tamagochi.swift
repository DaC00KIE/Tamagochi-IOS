//
//  Tamagochi.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//

import Foundation
import SwiftUI

class Tamagochi: ObservableObject {
    var name: String
    
    @Published var health = Stat(type: .health, value: 100, max_base: 100)
    @Published var hunger = Stat(type: .hunger)
    @Published var cleanliness = Stat(type: .cleanliness)
    @Published var fun = Stat(type: .fun)
    @Published var energy = Stat(type: .energy)
    
    @Published var characterImage: UIImage
    @Published var faceImage: UIImage? = UIImage(named: "Default_face")
    @Published var hatImage: UIImage? = UIImage(named: "none")
    @Published var selectedFace: String
    @Published var selectedHat: String
    
    @Published var purchasedFaces: [String] = ["face_default"]
    @Published var purchasedHats: [String] = ["hat_none"]
    
    @Published var skinColor: Color
    @Published var coins: Int = 1000
    
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    init() {
        self.name = "Default Name"
        self.characterImage = UIImage(named: "character_outline")!
        self.selectedFace = "face_default"
        self.selectedHat = "hat_none"
        self.skinColor = Color.red
    }
    
    static func generateNew() -> Tamagochi{
        let tamagochi = Tamagochi()
        return tamagochi
    }
    
    func getStat(_ type: StatType) -> Stat{
        switch type{
        case .health:
            return health
        case .hunger:
            return hunger
        case .cleanliness:
            return cleanliness
        case .fun:
            return fun
        default:
            return energy
        }
    }
    
    private func spendEnergy(amount: Int){
        if energy.value == 0{
            hunger.minus(by: amount)
            return
        }
        energy.minus(by: amount)
    }
    
    private func spendHunger(amount: Int){
        var modified_amount: Int = amount
        
        if cleanliness.percentage < 20{
            modified_amount = amount * 2
        }
        
        if hunger.value < modified_amount {
            health.minus(by: modified_amount / 10)
        }
        
        hunger.minus(by: modified_amount)
    }
    
    func eat() {
        hunger.add()
        
        spendEnergy(amount: 25)
    }

    func clean() {
        cleanliness.add()
        
        fun.minus(by: 50)
        spendEnergy(amount: 50)
    }

    func play() {
        fun.add()
        
        cleanliness.minus(by: 50)
        
        spendHunger(amount: 50)
        spendEnergy(amount: 80)
    }
    
    func rest() {
        energy.add()
        
        spendHunger(amount: 50)
    }
    
    func minusBars() {
        hunger.minus()
        cleanliness.minus()
        fun.minus()
        energy.minus()
    }
    
    func buyUpgrade(stat: ReferenceWritableKeyPath<Tamagochi, Stat>, cost: Int, increaseAmount: Int, type: String) {
            guard coins >= cost else {
                print("Not enough coins")
                return
            }

            switch type {
            case "Capacity":
                coins -= cost
                self[keyPath: stat].increaseCapacity()
            case "Action":
                coins -= cost
                self[keyPath: stat].increaseAction() // Menambahkan langsung ke nilai
            case "Timer":
                coins -= cost
                self[keyPath: stat].timerReduction() // Mengurangi dari nilai
            default:
                print("Invalid upgrade type")
            }
        }
}
