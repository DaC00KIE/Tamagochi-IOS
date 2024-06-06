//
//  HorizontalPageIndicator.swift
//  WatchTamagochi Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct HorizontalPageIndicator: View {
    let currentPage: Int
    let maxPages: Int
    
    var body: some View {
        HStack(spacing: 8) { // Add spacing between circles
            ForEach(0..<maxPages) { index in // Use correct range for indexing
                Circle()
                    .fill(currentPage == index + 1 ? Color.blue : Color.gray) // Use ternary for dynamic color
                    .frame(width: 8, height: 8) // Set appropriate size
            }
        }
    }
}

#Preview {
    HorizontalPageIndicator(currentPage: 2, maxPages: 5)
}
