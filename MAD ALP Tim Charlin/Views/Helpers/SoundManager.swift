//
//  SoundManager.swift
//  MAD ALP Tim Charlin
//
//  Created by student on 06/06/24.
//

import Foundation
import AVKit

class SoundManager {
    static let inst = SoundManager()
    
    var players: [SoundOption: [AVAudioPlayer]] = [:]
    
    enum SoundOption: String, CaseIterable {
        case Choose
        case Complete
        case Failed
        case Tab
    }
    
    private init() {
        preloadSounds()
    }
    
    private func preloadSounds() {
        for sound in SoundOption.allCases {
            players[sound] = []
            if let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") {
                do {
                    for _ in 0..<5 {
                        let player = try AVAudioPlayer(contentsOf: url)
                        player.prepareToPlay()
                        players[sound]?.append(player)
                    }
                } catch {
                    print("Error preloading sound \(sound.rawValue): \(error.localizedDescription)")
                }
            }
        }
    }
    
    func play(sound: SoundOption) {
        guard let playerList = players[sound] else { return }
        
        if let availablePlayer = playerList.first(where: { !$0.isPlaying }) {
            availablePlayer.play()
        } else {
            if let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") {
                do {
                    let newPlayer = try AVAudioPlayer(contentsOf: url)
                    newPlayer.prepareToPlay()
                    players[sound]?.append(newPlayer)
                    newPlayer.play()
                } catch {
                    print("Error creating new player for sound \(sound.rawValue): \(error.localizedDescription)")
                }
            }
        }
    }
}
