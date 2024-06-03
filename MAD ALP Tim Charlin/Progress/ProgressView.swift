//
//  ProgressView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

class ProgressViewModel: ObservableObject {
    @Published var hunger: Int = 1800
    @Published var cleanliness: Int = 5
    @Published var happiness: Int = 5
    @Published var energy: Int = 5
    
    @Published var maxHunger: Int = 3600
    @Published var maxCleanliness: Int = 10
    @Published var maxHappiness: Int = 10
    @Published var maxEnergy: Int = 10
    
//    var hungerPercentage: Int {
//      return toPercentage(hunger, maxHunger)
//    }
//    
//    private func toPercentage(_ value: Int, _ max: Int) -> Int{
//        guard max > 0 else { return 0 }
//        let percentage = Double(value) / Double(max) * 100
//        return Int(round(percentage))
//    }
}

struct ProgressView: View {
    @StateObject private var progressModel = ProgressViewModel()
    
    @State private var currentDate = Date.now
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
//    @State private var hunger: Int = 5
//    @State private var cleanliness: Int = 5
//    @State private var happiness: Int = 5
//    @State private var energy: Int = 5
    @State private var isClickedToShop: Bool = false
    
    let hungerTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    let cleanlinessTimer = Timer.publish(every: 120.0, on: .main, in: .common).autoconnect()
    let happinessTimer = Timer.publish(every: 90.0, on: .main, in: .common).autoconnect()
    let energyTimer = Timer.publish(every: 100.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Tamagotchi")
                .font(.largeTitle)
                .padding()
//            Text("\(currentDate)")
//                       .onReceive(timer) { input in
//                           currentDate = input
//                       }
            
            HStack {
                VStack {
                    Text("Hunger")
//                        .onReceive(hungerTimer) { _ in
//                            if hunger > 0{
//                                hunger -= 1
//                            }
//                        }
                    ProgressBar(value: $progressModel.hunger, maxValue: $progressModel.maxHunger)
                }
                VStack {
                    Text("Cleanliness")
                    ProgressBar(value: $progressModel.cleanliness, maxValue: $progressModel.maxCleanliness)
                }
            }
            .padding()
            
            HStack {
                VStack {
                    Text("Happiness \(progressModel.happiness)")
                    ProgressBar(value: $progressModel.happiness, maxValue: $progressModel.maxHappiness)
                }
                VStack {
                    Text("Energy")
                    ProgressBar(value: $progressModel.energy, maxValue: $progressModel.maxEnergy)
                }
            }
            .padding()
            
            HStack {
                Button(action: {
                    if progressModel.hunger < progressModel.maxHunger { progressModel.hunger += 1 }
                }) {
                    Text("Feed")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button(action: {
                    if progressModel.cleanliness < progressModel.maxCleanliness { progressModel.cleanliness += 1 }
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
                    if progressModel.happiness < progressModel.maxHappiness { progressModel.happiness += 1 }
                }) {
                    Text("Play")
                }
                .padding()
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button(action: {
                    if progressModel.energy < progressModel.maxEnergy { progressModel.energy += 1 }
                }) {
                    Text("Rest")
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            
            Text("Shop")
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                .onTapGesture {
                    self.isClickedToShop = true
                }
                .fullScreenCover(isPresented: $isClickedToShop) {
                    Content_View()
                }

            Spacer()
        }
        .onReceive(hungerTimer) { _ in
            if progressModel.hunger > 0 { progressModel.hunger -= 1 }
        }
        .onReceive(cleanlinessTimer) { _ in
            if progressModel.cleanliness > 0 { progressModel.cleanliness -= 1 }
        }
        .onReceive(happinessTimer) { _ in
            if progressModel.happiness > 0 { progressModel.happiness -= 1 }
        }
        .onReceive(energyTimer) { _ in
            if progressModel.energy > 0 { progressModel.energy -= 1 }
        }
    }
}

struct ProgressBar: View {
    @Binding var value: Int
    @Binding var maxValue: Int
    var percentage: Int{
        guard maxValue > 0 else { return 0 }
        let percentage = Double(value) / Double(maxValue) * 100
        return Int(round(percentage))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 100, height: 20)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Rectangle()
                .frame(width: CGFloat(value) / CGFloat(maxValue) * 100, height: 20)
                .foregroundColor(progressColor)
            
            HStack(alignment: .center) {
//              Spacer() // Pushes the text view to the center
              Text("\(percentage)%") // Displays hunger percentage
                .foregroundColor(.black)
                .font(.system(size: 10)) // Adjust font size as needed
                .frame(maxWidth: 100, alignment: .center)
//              Spacer() // Pushes the text view to the center
            }
        }
        .cornerRadius(10)
    }
    
    private var progressColor: Color {
        let percentage = CGFloat(value) / CGFloat(maxValue)
        switch percentage{
        case 0...0.2:
            return .red
        case 0.2...0.5:
            return .yellow
        default:
            return .green
        }
    }
}

#Preview {
    ProgressView()
}
