//
//  User.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 06/06/24.
//

import Foundation

class User: ObservableObject, Codable {
    @Published var name: String
    @Published var birthDate: Date
    @Published var place: String
    
    static let `default` = User(name: "GUEST", birthDate: Date(), place: "???")
    
    init(name: String, birthDate: Date, place: String) {
        self.name = name
        self.birthDate = birthDate
        self.place = place
    }
    
    // Function to save the user to UserDefaults
    func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "currentUser")
        }
    }
    
    // Function to load the user from UserDefaults
    static func loadFromUserDefaults() -> User {
        if let savedUserData = UserDefaults.standard.data(forKey: "currentUser"),
           let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
            return savedUser
        }
        return User.default
    }
    
    enum UserCred: CodingKey {
        case name, birthDate, place
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCred.self)
        name = try container.decode(String.self, forKey: .name)
        birthDate = try container.decode(Date.self, forKey: .birthDate)
        place = try container.decode(String.self, forKey: .place)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UserCred.self)
        try container.encode(name, forKey: .name)
        try container.encode(birthDate, forKey: .birthDate)
        try container.encode(place, forKey: .place)
    }
}
