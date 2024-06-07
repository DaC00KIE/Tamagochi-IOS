//
//  CustomizeView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//
import SwiftUI

struct CustomizeView: View {
    @StateObject var tamagochi: Tamagochi
    
    @State private var showColorPicker = false
    
    var body: some View {
        VStack {
            Spacer()
            
            TamagochiDisplay(tamagochi: tamagochi, frame: 500)
            
            VStack {
                ScrollableSelectionView(items: tamagochi.purchasedFaces, selectedItem: $tamagochi.selectedFace)
                ScrollableSelectionView(items: tamagochi.purchasedHats, selectedItem: $tamagochi.selectedHat)
                
                
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
