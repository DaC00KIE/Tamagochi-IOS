//
//  UpgradeItem.swift
//  MAD ALP Tim Charlin
//
//  Created by Charlin Leo on 06/06/24.
//

import Foundation

struct upgradeItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let cost: Int
    let statKeyPath: ReferenceWritableKeyPath<Tamagochi, Stat>
    let type: String
}
