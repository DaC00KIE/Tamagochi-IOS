//
//  Tamagochi.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//

import Foundation
import SwiftUI

class Tamagochi: ObservableObject{
    var name: String
    
    @Published var health = Stat(value: 100, max: 100)
    @Published var hunger = Stat(value: 1800, max: 3600)
    @Published var cleanliness = Stat(value: 1800, max: 3600)
    @Published var fun = Stat(value: 1800, max: 3600)
    @Published var energy = Stat(value: 1800, max: 3600)
    @Published var coins = 1000
    
    init(){
        self.name = "Pet"
    }
    
    func eat(amount: Int) {
        hunger.add(amount)
    }

    func clean(amount: Int) {
        cleanliness.add(amount)
        
        energy.minus(amount/4)
        fun.minus(amount/2)
    }

    func play(amount: Int) {
        fun.add(amount)
        
        energy.minus(amount/2)
        cleanliness.minus(amount/4)
        
        if hunger.value < amount/4{
            health.minus(5)
        }
        hunger.minus(amount/4)
        
    }
    
    func rest(amount: Int){
        energy.add(amount)
        hunger.minus(amount/4)
    }
    
    func minusBars(by: Int){
        hunger.minus(by)
        cleanliness.minus(by)
        fun.minus(by/2)
        energy.minus(by/2)
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
    
    var isFull: Bool {
        if value < max {
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
        value = max // Optionally, fill the stat to the new max value
    }
}

