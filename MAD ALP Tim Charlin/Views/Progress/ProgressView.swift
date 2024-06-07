//
//  ProgressView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI
import UIKit

struct ProgressView: View {
    @StateObject var tamagochi: Tamagochi
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    let defaultFrameWidth = 100
    
    var body: some View {
        
        VStack{
//            Spacer()
            
            ZStack {
                Image("pillar-hd")
                    .resizable()
                    .padding(.top, 30)
                    .frame(width: screenWidth > 600 ? 1100 : 400, height: screenWidth > 600 ? 1100 : 500)
                ZStack{
                    TamagochiDisplay(tamagochi: tamagochi, frame: screenWidth > 600 ? 650 : 300)
                        .padding(.top,-100)
                        .padding(.bottom, -50)
                    Spacer()
                    
                    VStack{
                        VStack {
                            Text("Health")
                            ProgressBar(stat: $tamagochi.health, frameWidth: screenWidth > 600 ? defaultFrameWidth * 7 : defaultFrameWidth * 2 + 40)
                            //                                .frame(width: screenWidth > 600 ? 1100 : 300)
                        }
                        Spacer()
                    }
                }
            }
           
//            Spacer()
            
            VStack {
                Text("\(tamagochi.name)")
                    .font(screenWidth > 600 ? .largeTitle : .title)
                    .padding()
                
                HStack {
                    VStack {
                        Text("Hunger")
                        
                        ProgressBar(stat: $tamagochi.hunger, frameWidth: screenWidth > 600 ? defaultFrameWidth * 2 : defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.hunger.isFull {
                                tamagochi.eat()
                                
                            }
                        }) {
                            Text("Feed")
                        }
                        .padding()
                        .frame(width: screenWidth > 600 ? 200 : 100, height: screenWidth > 600 ? 100 : 50)     .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(width: screenWidth > 600 ? 100 : 30)
                    
                    VStack {
                        Text("Cleanliness")
                        ProgressBar(stat: $tamagochi.cleanliness,  frameWidth: screenWidth > 600 ? defaultFrameWidth * 2 : defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.cleanliness.isFull {
                                tamagochi.clean()
                            }
                        }) {
                            Text("Clean")
                        }
                        .padding()
                        .frame(width: screenWidth > 600 ? 200 : 100, height: screenWidth > 600 ? 100 : 50)                           .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    VStack {
                        Text("Fun")
                        ProgressBar(stat: $tamagochi.fun,  frameWidth: screenWidth > 600 ? defaultFrameWidth * 2 : defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.fun.isFull{
                                tamagochi.play()
                            }
                        }) {
                            Text("Play")
                        }
                        .padding()
                        .frame(width: screenWidth > 600 ? 200 : 100, height: screenWidth > 600 ? 100 : 50)        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(width: screenWidth > 600 ? 100 : 30)
                    
                    VStack {
                        Text("Energy")
                        ProgressBar(stat: $tamagochi.energy, frameWidth: screenWidth > 600 ? defaultFrameWidth * 2 : defaultFrameWidth)
                        
                        Button(action: {
                            if !tamagochi.energy.isFull{
                                tamagochi.rest()
                            }
                        }) {
                            Text("Rest")
                        }
                        .padding()
                        .frame(width: screenWidth > 600 ? 200 : 100, height: screenWidth > 600 ? 100 : 50)                .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
//                .padding(.bottom, 100)
                
            }
            .padding(.top, screenWidth > 600 ? -300 : -100)
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
