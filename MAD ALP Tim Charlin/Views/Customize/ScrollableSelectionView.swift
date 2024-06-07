//
//  ScrollableSelectionView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 05/06/24.
//

import SwiftUI

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
                                Image(item + "_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray.opacity(isCentered ? 1 : 0.2))
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        withAnimation {
                                            scrollProxy.scrollTo(item, anchor: .center)
                                            selectedItem = item
                                        }
//                                        selectedItem = item
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
    let faces: [String] = ["face_default", "face_confused", "face_creeper", "face_derpy", "face_happy", "face_wooper"]
    @State var selectedFace = "face_confused"
    return ScrollableSelectionView(items: faces, selectedItem: $selectedFace)
}
