//
//  StatView.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct StatView: View {
    @StateObject var tamagochi: Tamagochi
    let statType: StatType
    
    var body: some View {
        
        VStack{
            
            Text("\(statType.rawValue)")
                .padding(.top, -40)
            
            switch statType{
            case .cleanliness:
                ProgressBar(stat: $tamagochi.cleanliness, frameWidth: 150).padding(.top, -20)
            case .hunger:
                ProgressBar(stat: $tamagochi.hunger, frameWidth: 150).padding(.vertical, -20)
            case .energy:
                ProgressBar(stat: $tamagochi.energy, frameWidth: 150).padding(.vertical, -20)
            case .fun:
                ProgressBar(stat: $tamagochi.fun, frameWidth: 150).padding(.vertical, -20)
            default:
                ProgressBar(stat: $tamagochi.health, frameWidth: 150).padding(.vertical, -20)
            }
            
            WatchDisplayTamagochi(tamagochi: tamagochi, frame: 200)
                .padding(.top, -40)
                .padding(.bottom, -40)
            
//            Spacer()
            
            switch statType{
            case .health:
                Text("\(tamagochi.name)")
                    .padding(.top, 10)
                    .padding(.bottom, 15)
            default:
                ButtonAction(tamagochi: tamagochi, statType: statType)
                    .padding(.bottom, 5)
            }
            
//            Spacer()
            
        }
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return StatView(tamagochi: tamagochi, statType: .health)
}
