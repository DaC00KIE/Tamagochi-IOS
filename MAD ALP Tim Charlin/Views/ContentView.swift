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
<<<<<<< HEAD
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
=======
    @State var tamagochi: Tamagochi
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            ProgressView(tamagochi: tamagochi)
                .tabItem{
                    Image("icon_home_outlined")
                    Text("Home")
                }
                .tag(0)
            
            ShopView(tamagochi: tamagochi)
                .tabItem{
                    Image("icon_upgrade_outlined")
                    Text("Shop")
                }
                .tag(1)
            
            CustomizeView(tamagochi: tamagochi)
                .tabItem{
                    Image("icon_outfit_outlined")
                    Text("Outfits")
                }
                .tag(2)
        }
        
       
    }
}
>>>>>>> main-backup

#Preview {
    @State var pet = Tamagochi()
    return ContentView(tamagochi: pet)
}

