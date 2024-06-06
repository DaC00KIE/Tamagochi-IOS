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
    
    @Published var health = Stat(type: .health, value: 100, max: 100)
    @Published var hunger = Stat(type: .hunger, value: 1800, max: 3600)
    @Published var cleanliness = Stat(type: .cleanliness, value: 1800, max: 3600)
    @Published var fun = Stat(type: .fun, value: 1800, max: 3600)
    @Published var energy = Stat(type: .energy, value: 1800, max: 3600)
    
    @Published var characterImage: UIImage
    @Published var faceImage: UIImage? = UIImage(named: "Default_face")
    @Published var hatImage: UIImage? = UIImage(named: "none")
    @Published var selectedFace: String
    @Published var selectedHat: String
    
    @Published var skinColor: Color
    
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    init() {
        self.name = "Default Name"
        self.characterImage = UIImage(named: "character")!
        self.selectedFace = "face_default"
        self.selectedHat = "hat_none"
        self.skinColor = Color.red
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
    
    func eat(amount: Int) {
        hunger.add(amount)
    }

    func clean(amount: Int) {
        cleanliness.add(amount)
        energy.minus(amount / 4)
        fun.minus(amount / 2)
    }

    func play(amount: Int) {
        fun.add(amount)
        energy.minus(amount / 2)
        cleanliness.minus(amount / 4)
        if hunger.value < amount / 4 {
            health.minus(5)
        }
        hunger.minus(amount / 4)
    }
    
    func rest(amount: Int) {
        energy.add(amount)
        hunger.minus(amount / 4)
    }
    
    func minusBars(by: Int) {
        hunger.minus(by)
        cleanliness.minus(by)
        fun.minus(by / 2)
        energy.minus(by / 2)
    }
}
