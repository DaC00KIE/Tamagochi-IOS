//
//  ContentView.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("hat_christmas")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
