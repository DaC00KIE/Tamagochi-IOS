//
//  MAD_ALP_Tim_CharlinApp.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

@main
struct MAD_ALP_Tim_CharlinApp: App {
    @StateObject var player = Player(id: 1, name: "DjDT")
    
    var body: some Scene {
        WindowGroup {
            ContentView(tamagochi: player.tamagochi)
        }
    }
}
