//
//  ProfileEditor.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 31/05/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var pet: Pet
    
    var body: some View {
        List {
            HStack {
                Text("Tamagochi Name")
                Spacer()
                TextField("name", text: $pet.name)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}

#Preview {
    ProfileEditor(pet: .constant(.default))
}
