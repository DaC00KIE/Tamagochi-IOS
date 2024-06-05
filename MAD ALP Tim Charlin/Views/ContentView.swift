//
//  ContentView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI



//struct ContentView: View {
//    var body: some View {
//        /*VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()*/
//        ProfileTextContainer(titleText: "Username", text:"Video")
//    }
//}

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagochi()
    
    var body: some View {
        TabView {
            Upgrade_Item(tamagotchi: tamagotchi)
                .tabItem {
                    Label("Upgrade", systemImage: "arrow.up.circle")
                }
            Text("Accessories Page")
                .tabItem {
                    Label("Accessories", systemImage: "star.circle")
                }
            Text("Gacha Page")
                .tabItem {
                    Label("Gacha", systemImage: "gift.circle")
                }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

#Preview {
    ContentView()
}

