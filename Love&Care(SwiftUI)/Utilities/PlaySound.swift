//
//  PlaySound.swift
//  Love&Care(SwiftUI)
//
//  Created by Mohamed Saad on 25/06/2024.
//

import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound(soundFile: String, soundType: String) {
    
    if let path = Bundle.main.path(forResource: soundFile, ofType: soundType) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("unable to play sound file")
        }
        
    }
    
}
