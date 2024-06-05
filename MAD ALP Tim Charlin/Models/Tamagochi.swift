//
//  Tamagochi.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//

import Foundation
import SwiftUI

//@State private var characterImage = UIImage(named: "character")! // Replace with your character image
//@State private var faceImage: UIImage?
//@State private var hatImage: UIImage?
//@State private var selectedFace: String = "Default_face"
//@State private var selectedHat: String = "none"

class Tamagochi: ObservableObject{
    var name: String
    var maxH: Int = 100
    var maxHunger: Int = 3000
    var maxClean: Int = 3000
    var maxFun: Int = 3000
    var maxEnergy: Int = 3000
    
    @Published var health: Stat
    @Published var hunger: Stat
    @Published var cleanliness: Stat
    @Published var fun: Stat
    @Published var energy: Stat
    @Published var coins: Int
    
<<<<<<< HEAD
    init() {
        self.name = "Pet"
        self.health = Stat(value: 100, max: self.maxH)
        self.hunger = Stat(value: 1800, max: self.maxHunger)
        self.cleanliness = Stat(value: 1800, max: self.maxClean)
        self.fun = Stat(value: 1800, max: self.maxFun)
        self.energy = Stat(value: 1800, max: self.maxEnergy)
        self.coins = 10000
=======
    @Published var characterImage: UIImage
    @Published var faceImage: UIImage? = UIImage(named:"Default_face")
    @Published var hatImage: UIImage? = UIImage(named:"none")
    @Published var selectedFace: String
    @Published var selectedHat: String
    
    init(){
        self.name = "Default Name"
        self.characterImage = UIImage(named: "character")!
        self.selectedFace = "face_default"
        self.selectedHat = "hat_none"
>>>>>>> main-backup
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
    
    func buyUpgrade(stat: ReferenceWritableKeyPath<Tamagochi, Stat>, cost: Int, increaseAmount: Int) {
        guard coins >= cost else {
            print("Not enough coins")
            return
        }
        coins -= cost
        self[keyPath: stat].increaseMax(by: increaseAmount)
    }
}

struct Stat {
    var value: Int
    var max: Int
    
<<<<<<< HEAD
    var isFull: Bool {
        if value < max {
=======
    var percentage: Int{
        guard max > 0 else { return 0 }
        let percentage = Double(value) / Double(max) * 100
        return Int(round(percentage))
    }
    
    var isFull: Bool{
        if value < max{
>>>>>>> main-backup
            return false
        }
        return true
    }
    
    mutating func add(_ amount: Int) {
        value = min(value + amount, max)
    }
    
    mutating func minus(_ amount: Int) {
        // not using max(value - amount, 0) because conflict w var name
        value -= amount
        if value < 0 {
            value = 0
        }
    }
    
    mutating func increaseMax(by amount: Int) {
        max += amount
        //        value = max // Optionally, fill the stat to the new max value
    }
}


