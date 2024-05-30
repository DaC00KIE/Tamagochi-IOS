//
//  ProfileView.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct ProfileTextContainer: View {
    var titleText: String
    var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Text(titleText)
                    .foregroundColor(.white)
                    .background(.gray)
                    .font(.system(size: 18))
                Spacer()
                
                Text(text)
                    .font(.system(size: 15))
            }
            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
        }.padding(4)
    }
}

struct ProfileView: View {
    
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftPet = Pet.default
    
    var body: some View {
        VStack {
            Text("Tamagochi Name")
                .font(.system(size: 30))
            HStack {
                ProfileTextContainer(titleText: "Age", text:"Video")
                ProfileTextContainer(titleText: "Owned", text:"20y 300d 20h")// change it to years-days-hours format
            }.padding(12)
            HStack {
                ProfileTextContainer(titleText: "Species", text:"Raptorum")
                ProfileTextContainer(titleText: "DOB", text:"2003-01-09")
            }.padding(12)
            HStack {
                ProfileTextContainer(titleText: "Level", text:"200")
                ProfileTextContainer(titleText: "Total XP", text:"999999999")//Max Value
            }.padding(12)
            Divider().padding()
            Button(action: {}) {
                Text("Edit Tamagochi Name")
                    .padding()
                    .frame(minWidth:100, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(4)
            }
        }
    }
}

#Preview {
    ProfileView()
        .environment(ModelData())
}
