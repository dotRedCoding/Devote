//
//  SoundPlayer.swift
//  Devote
//
//  Created by Jared Infantino on 2023-05-02.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) { // plugging in function parameters
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        }
        catch {
            print("Could not find sound file.")
        }
    }
        
}
