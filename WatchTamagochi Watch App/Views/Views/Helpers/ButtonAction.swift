//
//  ButtonAction.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct ButtonAction: View {
    @ObservedObject var tamagochi: Tamagochi
    let statType: StatType
    
    var body: some View {
        Button(action:{
            switch statType{
            case .fun:
                if !tamagochi.fun.isFull{
                    tamagochi.play(amount: 360)
                }
            default:
                Text("Wassup")
            }

        }){
            Text("\(tamagochi.getStat(statType).action)")
        }
        .frame(width: 150, height: 40)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

#Preview {
    @StateObject var tamagochi = Tamagochi()
    return ButtonAction(tamagochi: tamagochi, statType: .fun)
}
