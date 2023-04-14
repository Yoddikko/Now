//
//  MusicViewModel.swift
//  Now
//
//  Created by Ale on 13/04/23.
//

import SwiftUI
import AVFoundation

class MusicViewModel : ObservableObject {
    static let shared = MusicViewModel()
    
    @Published var musicToggle = true
    
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "ES_Let's Be Friends Again - Joseph Beg", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
//                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
    
        
}
