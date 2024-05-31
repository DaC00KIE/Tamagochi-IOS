//
//  InitializePetView.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 31/05/24.
//

import SwiftUI

struct InitializePetView: View {
    
    @Binding var pet: Pet
    
    var body: some View {
        VStack {
            Text("As You Went Home, you will need to name your Tamagochi. What will you name it?")
                .multilineTextAlignment(.center)
            
            TextField("Tamagotchi Name", text: $pet.name)
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: EmptyView())
    }
}

#Preview {
    InitializePetView(pet: .constant(.default))
}
