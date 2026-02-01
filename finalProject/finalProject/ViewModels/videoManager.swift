//
//  videoManager.swift
//  finalProject
//
//  Created by Kev on 1/31/26.
//

import Foundation
import AVFoundation
import AVKit
import Combine

    //MARK: create a demo screen on the tab that shows a tutorial video of how to use the app you can use navigation stack
    //MARK: create a video of how to sign-in, how to make prediction



final class videoManager: ObservableObject{
    
    
    @Published var demoVideo = Bundle.main.url(forResource: "demoVideo1", withExtension: "mov")
    
    @Published var demoVideo2 = Bundle.main.url(forResource: "demoVideo2", withExtension: "mov")
    
    @Published var videoPlayer = AVPlayer()
    @Published var videoPlayer2 = AVPlayer()
    
    init(){
        videoPlayer = AVPlayer(url: demoVideo!)
        videoPlayer2 = AVPlayer(url: demoVideo2!)
        
    }
    
    
    
    
    
    
    
}
