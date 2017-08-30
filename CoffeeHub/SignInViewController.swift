//
//  ViewController.swift
//  CoffeeHub
//
//  Created by Brett Fisher on 8/23/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class SignInViewController: UIViewController {
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoURL: URL = Bundle.main.url(forResource: "coffee_background", withExtension: "mov")!
        
        player = AVPlayer(url: videoURL)
        player?.actionAtItemEnd = .none
        player?.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        //Loop video
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.loopVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        // ******ERROR WITH VIDEO PLAYBACK NEED TO FIX******
    }
    
    func loopVideo() {
        player?.seek(to: kCMTimeZero)
        player?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

