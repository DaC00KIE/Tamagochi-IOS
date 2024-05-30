//
//  CircleImage.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("notfound").resizable().scaledToFit()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.black, lineWidth: 2)
            }
    }
}

#Preview {
    CircleImage()
}
