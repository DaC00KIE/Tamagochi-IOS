//
//  ProgressBar.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 04/06/24.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var stat: Stat
    
    private var value: Int{
        return stat.value
    }
    
    private var max: Int{
        return stat.max
    }
    
    var percentage: Int{
        guard max > 0 else { return 0 }
        let percentage = Double(value) / Double(max) * 100
        return Int(round(percentage))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 100, height: 20)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Rectangle()
                .frame(width: CGFloat(value) / CGFloat(max) * 100, height: 20)
                .foregroundColor(progressColor)
            
            HStack(alignment: .center) {
//              Spacer() // Pushes the text view to the center
              Text("\(percentage)%") // Displays hunger percentage
                .foregroundColor(.black)
                .font(.system(size: 10)) // Adjust font size as needed
                .frame(maxWidth: 100, alignment: .center)
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
    @State var stat = Stat(value: 41, max: 200)
    return ProgressBar(stat: $stat)
}
