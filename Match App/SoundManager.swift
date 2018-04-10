//
//  SoundManager.swift
//  Match App
//
//  Created by Sam Richardson on 4/10/18.
//  Copyright © 2018 Sam Richardson. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    static func playSound(_ effect:SoundEffect) {
        var soundFilename = ""
        
        // determine which sound effect we want to play
        // and set the appropriate filename
        switch effect {
        case .flip:
            soundFilename = "cardflip"
        case .shuffle:
            soundFilename = "shuffle"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
        }
        
        // get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        // create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        
        do {
        // create audio player object
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        
            
        // play the sound
        audioPlayer?.play()
        }
        catch {
            // couldn't create audio player object, log the error
            print("Couldn't create the audio player object for sound file \(soundFilename)")
        }
    }
}
