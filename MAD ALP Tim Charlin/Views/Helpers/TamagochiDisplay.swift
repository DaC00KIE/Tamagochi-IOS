//
//  TamagochiDisplay.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 05/06/24.
//

import SwiftUI

struct TamagochiDisplay: View {
    @StateObject var tamagochi: Tamagochi
    var frame: Int
    private var frameSize: CGFloat{
        return CGFloat(frame)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: tamagochi.characterImage)
                .resizable()
                .frame(width: frameSize, height: frameSize)
            if let faceImage = UIImage(named: "\(tamagochi.selectedFace)") {
                Image(uiImage: faceImage)
                    .resizable()
                    .frame(width: frameSize, height: frameSize)
            }
            if let hatImage = UIImage(named: "\(tamagochi.selectedHat)") {
                Image(uiImage: hatImage)
                    .resizable()
                    .frame(width: frameSize, height: frameSize)
            }
        }
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return TamagochiDisplay(tamagochi: tamagochi, frame: 400)
}
