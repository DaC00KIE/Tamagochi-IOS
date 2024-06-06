//
//  WatchTamagochiApp.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

@main
struct WatchTamagochi_Watch_AppApp: App {
    @StateObject var tamagochi = Tamagochi()
    
    var body: some Scene {
        WindowGroup {
            ContentView(tamagochi: tamagochi)
        }
    }
}
