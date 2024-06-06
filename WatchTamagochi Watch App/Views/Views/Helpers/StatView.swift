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
        
        NavigationStack {
            VStack{
                
                Text("\(statType.rawValue)")
                
                switch statType{
                case .cleanliness:
                    ProgressBar(stat: $tamagochi.cleanliness, frameWidth: 150)
                case .hunger:
                    ProgressBar(stat: $tamagochi.hunger, frameWidth: 150)
                case .energy:
                    ProgressBar(stat: $tamagochi.energy, frameWidth: 150)
                case .fun:
                    ProgressBar(stat: $tamagochi.fun, frameWidth: 150)
                default:
                    ProgressBar(stat: $tamagochi.health, frameWidth: 150)
                }
                
                NavigationLink (destination: SwitchAccessoryView(tamagochi: tamagochi)) {
                    WatchDisplayTamagochi(tamagochi: tamagochi, frame: 150)
                        .padding(.top, -40)
                        .padding(.bottom, -40)
                }
                .padding(.horizontal, 70)
                .padding(.top, 40)
                .padding(.bottom, 20)
                
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
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return StatView(tamagochi: tamagochi, statType: .health)
}
