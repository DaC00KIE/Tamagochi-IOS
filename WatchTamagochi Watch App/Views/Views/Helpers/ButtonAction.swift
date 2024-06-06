//
//  ButtonAction.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct ButtonAction: View {
    @StateObject var tamagochi: Tamagochi
    let statType: StatType
    
    var body: some View {
        Button(action:{
            switch statType{
            case .fun:
                tamagochi.play()
            case .hunger:
                tamagochi.eat()
            case .cleanliness:
                tamagochi.clean()
            case .energy:
                tamagochi.rest()
            default:
                Text("Wassup")
            }

        }){
            Text("\(tamagochi.getStat(statType).action)")
        }
        .frame(width: 150, height: 40)
        .background(tamagochi.getStat(statType).isFull ? Color.gray : Color.blue)
        .disabled(tamagochi.getStat(statType).isFull)
        .cornerRadius(10)
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return ButtonAction(tamagochi: tamagochi, statType: .energy)
}
