//
//  TamagochiDisplay.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 05/06/24.
//
//
//  TamagochiDisplay.swift
//  MAD ALP Tim Charlin
//
//  Created by Patrick Steven Kent Sugiarto on 05/06/24.
//

import SwiftUI

struct TamagochiDisplay: View {
    @ObservedObject var tamagochi: Tamagochi
    var frame: Int
    private var frameSize: CGFloat {
        return CGFloat(frame)
    }
    
    var body: some View {
        ZStack {
            // Character outline
            Image("character_outline")
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            
            // Character color overlay
            Image("character_color")
                .resizable()
//                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
                .colorMultiply(tamagochi.skinColor)
            
            // Selected face
            Image("\(tamagochi.selectedFace)")
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            
            // Selected hat
            Image("\(tamagochi.selectedHat)")
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
        }
    }
}

struct TamagochiDisplay_Previews: PreviewProvider {
    static var previews: some View {
        let tamagochi = Tamagochi()
        return TamagochiDisplay(tamagochi: tamagochi, frame: 500)
    }
}
