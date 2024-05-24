//
//  UserProfileView.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct UserProfileView: View {
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
            HStack {
                Button(action: {}) {
                    Text("Edit User")
                        .padding()
                        .frame(minWidth:100, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.gray)
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
}
