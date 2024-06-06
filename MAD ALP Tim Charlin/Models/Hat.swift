//
//  Hat.swift
//  MAD ALP Tim Charlin
//
//  Created by MacBook Pro on 30/05/24.
//

import Foundation
import SwiftUI

struct Hat: Identifiable, Hashable{
    var id: Int
    var name: String
    var price: Int
    var purchased: Bool
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
}
