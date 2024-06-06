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
    
    var faces: [String] = []
    var hats: [String] = []
    
    @State private var showColorPicker = false
    
    var body: some View {
        VStack {
            Spacer()
            
            TamagochiDisplay(tamagochi: tamagochi, frame: 500)
            
            VStack {
                ColorPicker("Pick a Colour:", selection: Binding(
                    get: {
                        Color(tamagochi.skinColor)
                    },
                    set: { newColor in
                        tamagochi.skinColor = UIColor(newColor)
                    }
                ))
                .padding()
                
                ScrollableSelectionView(items: tamagochi.purchasedFaces, selectedItem: $tamagochi.selectedFace)
                ScrollableSelectionView(items: tamagochi.purchasedHats, selectedItem: $tamagochi.selectedHat)
                
                Spacer()
            }
        }
    }
    
    struct ScrollableSelectionView: View {
        var items: [String]
        @Binding var selectedItem: String
        
        @State private var scrollOffset: CGFloat = 0.0
        @State private var dragOffset: CGFloat = 0.0
        
        var body: some View {
            GeometryReader { geometry in
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(items, id: \.self) { item in
                                GeometryReader { itemGeometry in
                                    let isCentered = abs(itemGeometry.frame(in: .global).midX - geometry.size.width / 2) < 20
                                    Image(item)
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .background(Color.gray.opacity(isCentered ? 1 : 0.2))
                                        .clipShape(Circle())
                                        .onTapGesture {
                                            withAnimation {
                                                scrollProxy.scrollTo(item, anchor: .center)
                                            }
                                            selectedItem = item
                                        }
                                        .onChange(of: isCentered) { newValue in
                                            if newValue {
                                                SoundManager.inst.play(sound: .Choose)
                                                selectedItem = item
                                            }
                                        }
                                }
                                .frame(width: 50, height: 50)
                            }
                        }
                        .padding(.horizontal, (geometry.size.width - 50) / 2)
                    }
                }
            }
            .frame(height: 70) // Adjust as needed
        }
    }
    
    struct CustomizeView_Previews: PreviewProvider {
        static var previews: some View {
            let tamagochi = Tamagochi()
            return CustomizeView(tamagochi: tamagochi)
        }
    }
}
