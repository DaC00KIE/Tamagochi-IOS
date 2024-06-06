//
//  Stat.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

struct Stat{
    var type: StatType
    var value: Int = 1000
    
    var max_base: Int = 3600
    var max_lvl: Int = 0
    var max: Int{
        return max_base + (max_lvl * 100)
    }
    
    // this is per 5 seconds
    var reduction_base: Int = 20
    var reduction_lvl: Int = 0
    var reduction: Int{
        return reduction_base - (reduction_lvl)
    }
    
    var increase_base: Int = 100
    var increase_lvl: Int = 0
    var increase: Int{
        return increase_base + (increase_lvl * 40)
    }
    
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
    
    var action: String{
        switch type{
        case .fun:
            return "Play"
        case .hunger:
            return "Feed"
        case .cleanliness:
            return "Clean"
        case .energy:
            return "Rest"
        default:
            return ""
        }
    }
    
    mutating func add(by: Int){
        value = min(value + by, max)
    }
    
    //auto reduces by increase value
    mutating func add(){
        value = min(value + increase, max)
    }
    
    mutating func minus(by: Int){
        // not using max(value - amount, 0) because conflict w var name
        value -= by
        if value < 0{
            value = 0
        }
    }
    
    // auto reduces by reduction value
    mutating func minus(){
        value -= reduction
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
