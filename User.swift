//
//  User.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 30/05/24.
//

import Foundation

class User {
    var name: String
    var birthDate = Date()
    
    static let `default` = User(name: "GUEST")
    
    init(name: String) {
        self.name = name
    }
    
    func changeName(name: String) {
        self.name = name
    }
}
