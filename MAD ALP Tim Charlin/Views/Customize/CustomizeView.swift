//
//  CustomizeView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//
import SwiftUI

struct CustomizeView: View {
    @StateObject var tamagochi: Tamagochi
    
    var faces: [String] = []
    var hats: [String] = []
    
    @State private var showColorPicker = false
    
    var body: some View {
        VStack {
            Spacer()
            
            TamagochiDisplay(tamagochi: tamagochi, frame: 500)
            
            VStack {
                HStack {
                    ColorPicker("Pick a Colour : ", selection: $tamagochi.skinColor)
                        .font(.headline)
                        .padding()
                }
                ScrollableSelectionView(items: tamagochi.purchasedFaces, selectedItem: $tamagochi.selectedFace)
                ScrollableSelectionView(items: tamagochi.purchasedHats, selectedItem: $tamagochi.selectedHat)
                Spacer()
            }
        }
    }
}

#Preview {
    @State var pet = Tamagochi()
    return CustomizeView(tamagochi: pet)
}
