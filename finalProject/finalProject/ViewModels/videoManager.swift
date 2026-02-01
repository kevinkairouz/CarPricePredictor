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


final class videoManager: ObservableObject{
    
    
    var videoPlayer: AVPlayer?
    private var demoVideo = Bundle.main.url(forResource: "demoVideo", withExtension: "mp4")
    
    
    
    
}
