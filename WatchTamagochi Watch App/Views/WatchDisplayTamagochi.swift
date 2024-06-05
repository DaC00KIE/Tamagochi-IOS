//
//  WatchDisplayTamagochi.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct WatchDisplayTamagochi: View {
    @ObservedObject var tamagochi: Tamagochi
      var frame: Int
      private var frameSize: CGFloat {
        return CGFloat(frame)
      }

      var body: some View {
        ZStack {
          // Assuming characterImage is a String referencing an asset
          Image("character_outline")
            .resizable()
            .scaledToFit()
            .frame(width: frameSize, height: frameSize)

            Image("\(tamagochi.selectedFace)")
              .resizable()
              .scaledToFit()
              .frame(width: frameSize, height: frameSize)
            Image("\(tamagochi.selectedHat)")
              .resizable()
              .scaledToFit()
              .frame(width: frameSize, height: frameSize)
        }
      }
    }

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return WatchDisplayTamagochi(tamagochi: tamagochi, frame: 100)
    
}
