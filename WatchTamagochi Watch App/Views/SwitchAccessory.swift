//
//  WatchSwitchAccessories.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct SwitchAccessoryView: View {
    @StateObject var tamagochi: Tamagochi
    
    var faces: [String] = ["face_default", "face_confused", "face_creeper", "face_derpy", "face_happy", "face_wooper"]
    var hats: [String] = ["hat_none", "hat_christmas", "hat_mexican"]
    
    var body: some View {
        VStack{
            Text("Hats")
            
            WatchDisplayTamagochi(tamagochi: tamagochi, frame: 200)
                .padding(.top, -40)
                .padding(.bottom, -40)
            
            
            ScrollableSelectionView(items: faces, selectedItem: $tamagochi.selectedFace)
        }
        
        
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return SwitchAccessoryView(tamagochi: tamagochi)
}
