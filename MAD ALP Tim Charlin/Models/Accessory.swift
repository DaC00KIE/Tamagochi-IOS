//
//  Accessory.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 05/06/24.
//

import Foundation

struct Accessory: Hashable{
    var name: String
    var isOwned: Bool = false
    var price: Int = 200
    
    var icon: String{
        return name + "_icon"
    }
    
    enum AccessoryType: String, CaseIterable{
        case face = "Face"
        case hat = "Hat"
    }
    var type: AccessoryType
}
