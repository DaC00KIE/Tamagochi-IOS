//
//  Accessory.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 05/06/24.
//

import Foundation

struct Accessory: Codable, Identifiable, Hashable{
    var id: Int
    var name: String
    var icon: String{
        return name + "_icon"
    }
    
    enum AccessoryType: String, CaseIterable, Codable{
        case face = "Face"
        case hat = "Hat"
    }
    var type: AccessoryType
}
