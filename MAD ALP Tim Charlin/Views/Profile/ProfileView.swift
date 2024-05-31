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
        VStack() {
            HStack {
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileDetails(pet: modelData.pet)
            } else {
                ProfileEditor(pet: $draftPet)
            }
        }
    }
}

#Preview {
    ProfileView()
        .environment(ModelData())
}
