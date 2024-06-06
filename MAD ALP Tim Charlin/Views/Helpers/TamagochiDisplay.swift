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
    private var frameSize: CGFloat{
        return CGFloat(frame)
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: tamagochi.characterImage)
                .resizable()
//                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
                .background(Color(tamagochi.skinColor))
//                .clipShape(Circle())
            
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

struct TamagochiDisplay_Previews: PreviewProvider {
    static var previews: some View {
        let tamagochi = Tamagochi()
        return TamagochiDisplay(tamagochi: tamagochi, frame: 500)
    }
}
