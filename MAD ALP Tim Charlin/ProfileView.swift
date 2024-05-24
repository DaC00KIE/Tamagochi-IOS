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
                    .font(.system(size: 20))
                Spacer()
                
                Text(text)
                    .font(.system(size: 16))
                    .padding(.leading, 16)
            }
            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
                .offset(y: 24)
        }.padding(4)
    }
}

struct ProfileView: View {
    var body: some View {
        HStack {
            ProfileTextContainer(titleText: "Username", text:"Video")
            ProfileTextContainer(titleText: "Username", text:"Video")
        }.padding(8)
        HStack {
            ProfileTextContainer(titleText: "Username", text:"Video")
            ProfileTextContainer(titleText: "Username", text:"Video")
        }.padding(8)
        HStack {
            ProfileTextContainer(titleText: "Username", text:"Video")
            ProfileTextContainer(titleText: "Username", text:"Video")
        }.padding(8)
    }
}

#Preview {
    ProfileView()
}
