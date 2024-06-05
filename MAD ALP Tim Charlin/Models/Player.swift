//
//  Player.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 05/06/24.
//

import Foundation

class Player: ObservableObject, Identifiable{
    var id: Int
    @Published var name: String
    @Published var coins: Int
    
    let dateStarted: Date
    var currentTime: Date{
        return Date.now
    }
    var timePlayed: TimeInterval{
        return currentTime.timeIntervalSince(dateStarted)
    }
    
    init(id: Int, name: String){
        self.dateStarted = Date.now
        self.id = id
        self.name = name
        self.coins = 1000
    }
}
