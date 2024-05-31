//
//  ProfileDetails.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 31/05/24.
//

import SwiftUI
import Foundation

struct ProfileDetails: View {
    var pet: Pet
    
    var body: some View {
        VStack {
            Text(pet.name)
                .font(.system(size: 30))
            HStack {
                ProfileTextContainer(titleText: "Age", text:String(Int(pet.age))) // Used to round down the age.
                ProfileTextContainer(titleText: "Owned", text:"20y 300d 20h")// change it to years-days-hours format
            }.padding(12)
            HStack {
                ProfileTextContainer(titleText: "Species", text:pet.species)
                ProfileTextContainer(titleText: "DOB", text: pet.dob.formatted(date: .numeric, time: .omitted))
            }.padding(12)
            HStack {
                ProfileTextContainer(titleText: "Level", text:String(pet.level))
                ProfileTextContainer(titleText: "Total XP", text:String(pet.xp))//Max Value
            }.padding(12)
            /*
            Divider().padding()
            
            Button(action: {}) {
                Text("Edit Tamagochi Name")
                    .padding()
                    .frame(minWidth:100, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(4)
            }*/
        }
    }
}

#Preview {
    ProfileDetails(pet: Pet.default)
        .environment(ModelData())
}
