//
//  ProgressBar.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var stat: Stat
    var frameWidth: Int
    
    private var value: Int{
        return stat.value
    }
    
    private var max: Int{
        return stat.max
    }
    
    private var percentage: Int{
        return stat.percentage
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: CGFloat(frameWidth), height: 20)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Rectangle()
                .frame(width: CGFloat(value) / CGFloat(max) * CGFloat(frameWidth), height: 20)
                .foregroundColor(progressColor)
            
            HStack(alignment: .center) {
//              Spacer() // Pushes the text view to the center
              Text("\(value)/ \(max)") // Displays hunger percentage
                .foregroundColor(.black)
                .font(.system(size: 10)) // Adjust font size as needed
                .frame(maxWidth: CGFloat(frameWidth), alignment: .center)
//              Spacer() // Pushes the text view to the center
            }
        }
        .cornerRadius(10)
    }
    
    private var progressColor: Color {
        let percentage = CGFloat(value) / CGFloat(max)
        switch percentage{
        case 0...0.2:
            return .red
        case 0.2...0.5:
            return .yellow
        default:
            return .green
        }
    }
}

#Preview {
    @State var stat = Stat(value: 100, base_max: 200)
    return ProgressBar(stat: $stat, frameWidth: 200)
}
