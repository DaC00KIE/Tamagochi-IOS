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
                .onAppear {
                    SoundManager.inst.play(sound: .Tab)
                }
            
            ShopView(tamagotchi: tamagochi)
                .tabItem{
                    Image("icon_upgrade_outlined")
                    Text("Shop")
                }
                .tag(1)
                .onAppear {
                    SoundManager.inst.play(sound: .Tab)
                }
            
            CustomizeView(tamagochi: tamagochi)
                .tabItem{
                    Image("icon_outfit_outlined")
                    Text("Outfits")
                }
                .tag(2)
                .onAppear {
                    SoundManager.inst.play(sound: .Tab)
                }
            UserProfileView()
                .tabItem{
                    Image("icon_upgrade_outlined")
                    Text("Profile")
                }
                .tag(3)
                .onAppear {
                    SoundManager.inst.play(sound: .Tab)
                }
        }
        
       
    }
}

#Preview {
    @State var pet = Tamagochi()
    return ContentView(tamagochi: pet)
}
