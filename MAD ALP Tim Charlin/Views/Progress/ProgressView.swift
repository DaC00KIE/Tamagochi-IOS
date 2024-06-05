//
//  ProgressView.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct ProgressView: View {
    @StateObject var tamagochi: Tamagochi
    
    @State private var currentDate = Date.now
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let defaultTimer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    let defaultFrameWidth = 100
    
    var body: some View {
        
        VStack{
            ZStack{
                TamagochiDisplay(tamagochi: tamagochi, frame: 300)
                    .padding(.top, 20)
                    .padding(.bottom, -50)
                
                VStack{
                    VStack {
                        Text("Health")
                        ProgressBar(stat: $tamagochi.health, frameWidth: defaultFrameWidth * 2 + 40)
                    }
                    Spacer()
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
                                tamagochi.eat(amount: 360)
                                
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
                                tamagochi.clean(amount: 360)
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
                                tamagochi.play(amount: 360)
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
                                tamagochi.rest(amount: 360)
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
                .padding(.bottom)
                
    //            Text("Shop")
    //                .padding()
    //                .frame(width: CGFloat(defaultFrameWidth) * 2 + 40)
    //                .background(Color.orange)
    //                .foregroundColor(.white)
    //                .cornerRadius(10)
    //                .onTapGesture {
    //                    self.isClickedToShop = true
    //                }
    //                .fullScreenCover(isPresented: $isClickedToShop) {
    //                    Content_View(tamagochi: tamagochi)
    //                }

                Spacer()
            }
            .padding(.top, -60)
            .onReceive(defaultTimer) { _ in
                tamagochi.minusBars(by: 200)
            }
            
        }
        
        
    }
}


#Preview {
//    var defaultPet = new Tamagochi()
    @State var pet = Tamagochi()
    return ProgressView(tamagochi: pet)
}
