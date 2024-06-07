//
//  ProgressView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct ProgressView: View {
    @StateObject var tamagochi: Tamagochi
    
    let defaultFrameWidth = 100
    
    var body: some View {
        
        VStack{
            Spacer()
            
            ZStack {
                    Image("pillar-hd")
                        .resizable()
                        .aspectRatio(1.3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                ZStack{
                    TamagochiDisplay(tamagochi: tamagochi, frame: 300)
                        .padding(.top,-100)
                        .padding(.bottom, -50)
                    
                    
                    VStack{
                        VStack {
                            Text("Health")
                            ProgressBar(stat: $tamagochi.health, frameWidth: defaultFrameWidth * 2 + 40)
                        }
                        Spacer()
                    }
                }
            }
            
            VStack {
                Text("\(tamagochi.name)")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    VStack {
                        Text("Hunger")
                            
                        ProgressBar(stat: $tamagochi.hunger, frameWidth: defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.hunger.isFull {
                                tamagochi.eat()
                                
                            }
                        }) {
                            Text("Feed")
                        }
                        .padding()
                        .frame(width: CGFloat(defaultFrameWidth))
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        Text("Cleanliness")
                        ProgressBar(stat: $tamagochi.cleanliness, frameWidth: defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.cleanliness.isFull {
                                tamagochi.clean()
                            }
                        }) {
                            Text("Clean")
                        }
                        .padding()
                        .frame(width: CGFloat(defaultFrameWidth))
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    VStack {
                        Text("Fun")
                        ProgressBar(stat: $tamagochi.fun, frameWidth: defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.fun.isFull{
                                tamagochi.play()
                            }
                        }) {
                            Text("Play")
                        }
                        .padding()
                        .frame(width: CGFloat(defaultFrameWidth))
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    VStack {
                        Text("Energy")
                        ProgressBar(stat: $tamagochi.energy, frameWidth: defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.energy.isFull{
                                tamagochi.rest()
                            }
                        }) {
                            Text("Rest")
                        }
                        .padding()
                        .frame(width: CGFloat(defaultFrameWidth))
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 50)
                
            }
            .padding(.top, -60)
            .onReceive(tamagochi.timer) { _ in
                tamagochi.minusBars()
            }
            
        }
        
        
    }
}


#Preview {
//    var defaultPet = new Tamagochi()
    @State var pet = Tamagochi()
    return ProgressView(tamagochi: pet)
}
