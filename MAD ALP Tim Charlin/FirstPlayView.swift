//
//  FirstPlayView.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct FirstPlayView: View {
    var body: some View {
        
        VStack {
            
            Text("Welcome to Tamagochi-iOS!")
                .font(.system(size: 24))
            
            Spacer()
            
            Spacer() //TODO: Replace with image of pet
            
            Text("On a rainy day, you came across an abandoned box. You found a peculiar pet. There were no labels or anything identifying, but you know you cannot let the pet be at this state. So you decided to take it home.")
                .frame(minWidth:300, maxWidth: 400)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            
            /*TODO: Add NavigationLink to MainMenu.
             Cannot proceed without Main Menu
             when Main Menu implemented, initialize pet
             immediately go to renaming screen.
             
             */
            Text("Go Home")
                .padding()
                .frame(minWidth:100, maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                .padding(4)
        }.padding()
    }
}

#Preview {
    FirstPlayView()
}
