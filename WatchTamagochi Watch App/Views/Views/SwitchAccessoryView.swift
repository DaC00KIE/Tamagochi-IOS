//
//  WatchSwitchAccessories.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct SwitchAccessoryView: View {
    @State private var currentPage: Int = 1
    @State private var offset:CGFloat = 0.0
    @StateObject var tamagochi: Tamagochi
    
    var faces: [String] = ["face_default", "face_confused", "face_creeper", "face_derpy", "face_happy", "face_wooper"]
    var hats: [String] = ["hat_none", "hat_christmas", "hat_mexican"]
    
    var body: some View {
        VStack {
            VStack {
                VStack{
                    Text(currentPage == 1 ? "Hats" : "Faces")
                    
                        WatchDisplayTamagochi(tamagochi: tamagochi, frame: 150)
                            .padding(.top, -10)
                        .padding(.bottom, -40)
                    
                    
                    if currentPage == 1{
                        ScrollableSelectionView(items: hats, selectedItem: $tamagochi.selectedHat)
                    }else{
                        ScrollableSelectionView(items: faces, selectedItem: $tamagochi.selectedFace)
                    }
                    
                }
                .frame(height: 200)
                
                HorizontalPageIndicator(currentPage: currentPage, maxPages: 2)
            }
        }
        .frame(width: .infinity, height: .infinity)
        .padding(.top, -20)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation.width
                }
                .onEnded { _ in
                    // Check for significant horizontal swipe (more than 20 units)
                    if abs(offset) > 20 {
                        currentPage += 1
                        if currentPage > 2{
                            currentPage = 1
                        }
                    }
                    offset = 0.0 // Reset offset for next swipe
                }
        )
        
        
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return SwitchAccessoryView(tamagochi: tamagochi)
}
