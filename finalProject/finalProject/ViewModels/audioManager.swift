//
//  audioManager.swift
//  finalProject
//
//  Created by Kev on 1/16/26.
//

import Foundation
import Combine
import AVFoundation

final class audioManager: ObservableObject {
    
    static let shared = audioManager()
    private var soundEffectPlayer: AVAudioPlayer?
    private var backgroundMusicPlayerL: AVAudioPlayer?
    
    func playMusic(named soundName: String){
        if let url = Bundle.main.url(forResource: soundName, withExtension: ".wav"){
            do{
                soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
                soundEffectPlayer?.play()
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func stopMusic(){
        soundEffectPlayer?.stop()
    }
    
    func pauseMusic(){
        soundEffectPlayer?.pause()
    }
    
    
    
    
    
}
