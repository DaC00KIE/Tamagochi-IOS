//
//  CustomizeView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//
import SwiftUI

struct CustomizeView: View {
    @StateObject var tamagochi: Tamagochi
//    @State private var color = Color.red
    
    var faces: [String] = ["face_default", "face_confused", "face_creeper", "face_derpy", "face_happy", "face_wooper"]
    var hats: [String] = ["hat_none", "hat_christmas", "hat_mexican"]
    
    @State private var showColorPicker = false
    
    var body: some View {
        VStack {
            Spacer()
            
            TamagochiDisplay(tamagochi: tamagochi, frame: 500)
            
            VStack {
                ScrollableSelectionView(items: faces, selectedItem: $tamagochi.selectedFace)
                ScrollableSelectionView(items: hats, selectedItem: $tamagochi.selectedHat)
                
                
                ColorPicker("Pick a Colour: ", selection: $tamagochi.skinColor)
                
                Spacer()
            }
        }
    }
}

#Preview {
    @State var pet = Tamagochi()
    return CustomizeView(tamagochi: pet)
}
