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
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case Choose
        case Complete
        case Failed
        case Tab
    }
    
    func play(sound: SoundOption){
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else { return }
    
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error Playing Sound. \(error.localizedDescription)")
        }
    }
}
