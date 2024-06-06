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
            
            WatchDisplayTamagochi(tamagochi: tamagochi, frame: 150)
                .padding(.top, -20)
                .padding(.bottom, -30)
            
            switch statType{
            case .fun:
                Button(action:{
                    if !tamagochi.fun.isFull{
                        tamagochi.play(amount: 360)
                    }
                }){
                    Text("Play")
                }
                .frame(width: 150, height: 40)
                .background(Color.blue)
                .cornerRadius(10)

            default:
                Text("\(tamagochi.name)")
            }
            
//            Spacer()
            
        }
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return StatView(tamagochi: tamagochi, statType: .fun)
}
