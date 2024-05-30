//
//  UserProfileView.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct UserProfileView: View {
    
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftUser = User.default
    
    var body: some View {
        VStack {
            HStack {
                CircleImage().padding(32)
                VStack {
                    ProfileTextContainer(titleText: "User", text:"name")
                    ProfileTextContainer(titleText: "Total Time", text:"364d 23h")
                    //Originally Hours-minutes, then change to days-hours, then years-days.
                    ProfileTextContainer(titleText: "DOB", text:"09-01-2003")
                }
            }
            Divider().padding()
            HStack {
                Button(action: {}) {
                    Text("Edit User")
                        .padding()
                        .frame(minWidth:100, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(4)
                }
                Button(action: {}) {
                    Text("Log Out")
                        .padding()
                        .frame(minWidth:100, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                        .padding(4)
                }
            }
        }.padding(16)
    }
}

#Preview {

    UserProfileView()
        .environment(ModelData())
}
