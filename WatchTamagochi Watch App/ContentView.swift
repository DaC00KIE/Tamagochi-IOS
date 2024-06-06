//
//  ContentView.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage: Int = 1
    @State private var offset:CGFloat = 0.0
    @StateObject var tamagochi: Tamagochi
    
    var body: some View {
        NavigationView {
            VStack {
                HomeView(tamagochi: tamagochi)
            }
        }
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return ContentView(tamagochi: tamagochi)
}
