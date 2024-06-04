//
//  ProgressView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

//class ProgressViewModel: ObservableObject {
//    @Published var hunger: Int = 1800
//    @Published var cleanliness: Int = 5
//    @Published var happiness: Int = 5
//    @Published var energy: Int = 5
//    
//    @Published var maxHunger: Int = 3600
//    @Published var maxCleanliness: Int = 10
//    @Published var maxHappiness: Int = 10
//    @Published var maxEnergy: Int = 10
//    
//}

struct ProgressView: View {
    @StateObject private var tamagochi = Tamagochi()
    
    @State private var currentDate = Date.now
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    @State private var isClickedToShop: Bool = false
    
    let defaultTimer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Tamagochi")
                .font(.largeTitle)
                .padding()
            
            Text("Health: \(tamagochi.health.value)/ \(tamagochi.health.max)")
            
            HStack {
                VStack {
                    Text("Hunger \(tamagochi.hunger.value)")
                    ProgressBar(stat: $tamagochi.hunger)
                }
                VStack {
                    Text("Cleanliness")
                    ProgressBar(stat: $tamagochi.cleanliness)
                }
            }
            .padding()
            
            HStack {
                VStack {
                    Text("Fun")
                    ProgressBar(stat: $tamagochi.fun)
                }
                VStack {
                    Text("Energy")
                    ProgressBar(stat: $tamagochi.energy)
                }
            }
            .padding()
            
            HStack {
                Button(action: {
                    if !tamagochi.hunger.isFull {
                        tamagochi.eat(amount: 100)
                    }
                }) {
                    Text("Feed")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button(action: {
                    if !tamagochi.cleanliness.isFull {
                        tamagochi.clean(amount: 100)
                    }
                }) {
                    Text("Clean")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            
            HStack {
                Button(action: {
                    if !tamagochi.fun.isFull{
                        tamagochi.play(amount: 100)
                    }
                }) {
                    Text("Play")
                }
                .padding()
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button(action: {
                    if !tamagochi.energy.isFull{
                        tamagochi.rest(amount: 100)
                    }
                }) {
                    Text("Rest \(!tamagochi.energy.isFull)")
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            
//            Text("Shop")
//                .padding()
//                .background(Color.orange)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//                .onTapGesture {
//                    self.isClickedToShop = true
//                }
//                .fullScreenCover(isPresented: $isClickedToShop) {
//                    Content_View()
//                }

            Spacer()
        }
        .onReceive(defaultTimer) { _ in
            tamagochi.minusBars(by: 200)
        }
//        .onReceive(hungerTimer) { _ in
//            if progressModel.hunger > 0 { progressModel.hunger -= 1 }
//        }
//        .onReceive(cleanlinessTimer) { _ in
//            if progressModel.cleanliness > 0 { progressModel.cleanliness -= 1 }
//        }
//        .onReceive(happinessTimer) { _ in
//            if progressModel.happiness > 0 { progressModel.happiness -= 1 }
//        }
//        .onReceive(energyTimer) { _ in
//            if progressModel.energy > 0 { progressModel.energy -= 1 }
//        }
        
    }
}


#Preview {
//    var defaultPet = new Tamagochi()
    ProgressView()
}
