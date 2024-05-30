//
//  Pet.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 30/05/24.
//

import Foundation

class Pet {
    
    var name: String = ""
    
    var cleanliness: Int = 100
    var hunger: Int = 100
    var age: Float = 0
    var durOwned: Int = 0 //Seconds.
    var species: String = "Raptorum" //TODO: Include more Species names.
    
    static let `default` = Pet(name: "")
    
    init(name: String) {
        self.name = name;
    }
    
    
    func changeName(name: String) {
        self.name = name;
    }
}
