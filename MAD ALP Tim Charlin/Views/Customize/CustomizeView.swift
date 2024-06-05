//
//  CustomizeView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//

import SwiftUI

struct CustomizeView: View {
    @StateObject var tamagochi: Tamagochi
    
    var faces: [String] = ["face_default", "face_confused", "face_creeper", "face_derpy", "face_happy", "face_wooper"]
    var hats: [String] = ["hat_none", "hat_christmas", "hat_mexican"]
    var colour: [String] = ["", "", ""]
    
    var body: some View {
        VStack {
            Spacer()

            TamagochiDisplay(tamagochi: tamagochi, frame: 500)
            
            ZStack {
                VStack {
                    ScrollableSelectionView(items: faces, selectedItem: $tamagochi.selectedFace)
                    ScrollableSelectionView(items: hats, selectedItem: $tamagochi.selectedHat)
                }
            }
            
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

#Preview {
    @State var pet = Tamagochi()
    return CustomizeView(tamagochi: pet)
}
