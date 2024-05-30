//
//  ProgressView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct ProgressView: View {
    @State private var hunger: Int = 5
    @State private var cleanliness: Int = 5
    @State private var happiness: Int = 5
    @State private var energy: Int = 5

    let hungerTimer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    let cleanlinessTimer = Timer.publish(every: 6.0, on: .main, in: .common).autoconnect()
    let happinessTimer = Timer.publish(every: 7.0, on: .main, in: .common).autoconnect()
    let energyTimer = Timer.publish(every: 8.0, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Tamagotchi")
                .font(.largeTitle)
                .padding()
            
            HStack {
                VStack {
                    Text("Hunger")
                    ProgressBar(value: $hunger, maxValue: 10)
                }
                VStack {
                    Text("Cleanliness")
                    ProgressBar(value: $cleanliness, maxValue: 10)
                }
            }
            .padding()

            HStack {
                VStack {
                    Text("Happiness")
                    ProgressBar(value: $happiness, maxValue: 10)
                }
                VStack {
                    Text("Energy")
                    ProgressBar(value: $energy, maxValue: 10)
                }
            }
            .padding()

            HStack {
                Button(action: {
                    if hunger < 10 { hunger += 1 }
                }) {
                    Text("Feed")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button(action: {
                    if cleanliness < 10 { cleanliness += 1 }
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
                    if happiness < 10 { happiness += 1 }
                }) {
                    Text("Play")
                }
                .padding()
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button(action: {
                    if energy < 10 { energy += 1 }
                }) {
                    Text("Rest")
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .onReceive(hungerTimer) { _ in
            if hunger > 0 { hunger -= 1 }
        }
        .onReceive(cleanlinessTimer) { _ in
            if cleanliness > 0 { cleanliness -= 1 }
        }
        .onReceive(happinessTimer) { _ in
            if happiness > 0 { happiness -= 1 }
        }
        .onReceive(energyTimer) { _ in
            if energy > 0 { energy -= 1 }
        }
    }
}

struct ProgressBar: View {
    @Binding var value: Int
    var maxValue: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 100, height: 20)
                .opacity(0.3)
                .foregroundColor(Color.gray)

            Rectangle()
                .frame(width: CGFloat(value) * 10, height: 20)
                .foregroundColor(Color.green)
        }
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ProgressView()
}
