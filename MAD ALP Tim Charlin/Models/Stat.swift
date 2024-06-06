//
//  Stat.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

struct Stat{
    var type: StatType
    var value: Int
    var max: Int
    
    var percentage: Int{
        guard max > 0 else { return 0 }
        let percentage = Double(value) / Double(max) * 100
        return Int(round(percentage))
    }
    
    var isFull: Bool{
        if value < max{
            return false
        }
        return true
    }
    
    mutating func add(_ amount: Int){
        value = min(value + amount, max)
    }
    
    mutating func minus(_ amount: Int){
        // not using max(value - amount, 0) because conflict w var name
        value -= amount
        if value < 0{
            value = 0
        }
    }

}

enum StatType: String, CaseIterable{
    case health = "Health"
    case hunger = "Hunger"
    case fun = "Fun"
    case energy = "Energy"
    case cleanliness = "Cleanliness"
}
