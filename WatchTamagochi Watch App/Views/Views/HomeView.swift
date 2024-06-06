//
//  HomeView.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct HomeView: View {
    @State private var currentPage = 1
    @State private var offset:CGFloat = 0.0
    @StateObject var tamagochi: Tamagochi
    
    var body: some View {
        let statsDict: [Int: StatType] = [
            1: .health,
            2: .hunger,
            3: .energy,
            4: .fun,
            5: .cleanliness
        ]
        
        NavigationStack {
            VStack {
                VStack{ // Adjust spacing as needed
                    if let statType = statsDict[currentPage] {
                        StatView(tamagochi: tamagochi, statType: statType)
                    } else {
                      // Handle the case where statType is nil (e.g., display default text)
                      Text("Stat: N/A")
                    }
                }
                .frame(height: 200)
                
                HorizontalPageIndicator(currentPage: currentPage, maxPages: statsDict.count)
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
              if offset < -20 {
                  currentPage += 1 // Increase for right swipe
                  if currentPage > 5{
                      currentPage = 1
                  }
              } else if offset > 20 {
                  currentPage -= 1 // Decrease for left swipe
                  if currentPage < 1{
                      currentPage = 5
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
