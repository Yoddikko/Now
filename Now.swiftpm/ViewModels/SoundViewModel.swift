//
//  MusicViewModel.swift
//  Now
//
//  Created by Ale on 13/04/23.
//

import SwiftUI
import AVFoundation

class SoundViewModel : ObservableObject {
    static let shared = SoundViewModel()
    
    @Published var musicToggle = true
    
    var musicPlayer: AVAudioPlayer?
    var soundPlayer: AVAudioPlayer?
    
    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "ES_Let's Be Friends Again - Joseph Beg", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                musicPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let musicPlayer = musicPlayer else { return }
                musicPlayer.numberOfLoops = -1
                musicPlayer.prepareToPlay()
                musicPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let musicPlayer = musicPlayer else { return }
        musicPlayer.stop()
    }
    
    func playCompletionSoundHarp1() {
        soundPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "harp_1", ofType: "mp3")!))
        soundPlayer?.prepareToPlay()
        soundPlayer?.play()
    }
    
    
}
