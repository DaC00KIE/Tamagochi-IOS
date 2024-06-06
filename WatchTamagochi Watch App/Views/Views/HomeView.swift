//
//  HomeView.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct HomeView: View {
    @State private var currentPage = 2.0
    @State private var offset:CGFloat = 0.0
    @StateObject var tamagochi: Tamagochi
    
    var body: some View {
        let statsDict: [Double: StatType] = [
            1.0: .health,
            2.0: .hunger,
            3.0: .energy,
            4.0: .fun,
            5.0: .cleanliness
        ]
        
        VStack {
            VStack(spacing: 10) { // Adjust spacing as needed
                if let statType = statsDict[currentPage] {
                    StatView(tamagochi: tamagochi, statType: statType)
      
                    if statType != .health{
                        
                    }
                    
                } else {
                  // Handle the case where statType is nil (e.g., display default text)
                  Text("Stat: N/A")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(
          DragGesture()
            .onChanged { gesture in
              offset = gesture.translation.width
            }
            .onEnded { _ in
              // Check swipe direction and update value
              if offset > 20 {
                  currentPage += 1.0 // Increase for right swipe
                  if currentPage > 5.0{
                      currentPage = 1.0
                  }
              } else if offset < 20 {
                  currentPage -= 1.0 // Decrease for left swipe
                  if currentPage < 1.0{
                      currentPage = 5.0
                  }
              }
              offset = 0.0 // Reset offset for next swipe
            }
    )

    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return HomeView(tamagochi: tamagochi)
}
