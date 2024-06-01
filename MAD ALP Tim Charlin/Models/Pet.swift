//
//  Pet.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import Foundation

struct Pet: Codable{
    var name: String
    var hunger: Int
    var health: Int
    var fun: Int
    var cleanliness: Int
    var energy: Int
    
    var age: String
    var level: Int
    
    var color: PetColor
    
//    init(_ petColor: PetColor){
//        self.name = "Pet"
//        self.color = petColor
//    }
    
}

enum PetColor: String, CaseIterable, Codable{
    case red = "Red"
    case blue = "Blue"
    case yellow = "Yellow"
    
    var colorCode:String{
        switch self{
        case .red:
            return "red"
        case .blue:
            return "blue"
        case .yellow:
            return "yellow"
        }
    }
}
