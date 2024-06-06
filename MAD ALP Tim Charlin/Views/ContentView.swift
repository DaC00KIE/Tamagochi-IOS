//
//  ContentView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct ContentView: View {
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
            
//            ShopView(tamagochi: tamagochi)
//            Text("Shop View")
//                .tabItem{
//                    Image("icon_upgrade_outlined")
//                    Text("Shop")
//                }
//                .tag(1)
            
            CustomizeView(tamagochi: tamagochi)
                .tabItem{
                    Image("icon_outfit_outlined")
                    Text("Outfits")
                }
                .tag(1)
        }
        
       
    }
}

#Preview {
    @State var pet = Tamagochi()
    return ContentView(tamagochi: pet)
}
