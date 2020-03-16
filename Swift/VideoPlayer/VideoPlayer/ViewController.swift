//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Terry Dengis on 1/24/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import WebKit

class ViewController: UIViewController {

    var playerController = AVPlayerViewController ()
    var player = AVPlayer ()
    var streamController = AVPlayerViewController ()
    var streamer = AVPlayer ()
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //local video
        let videoFile = Bundle.main.path(forResource: "SampleVideo", ofType: "mp4")
        player = AVPlayer (url: URL (fileURLWithPath: videoFile!))
        playerController.player = player
        //stream video
        let streamURL = NSURL (string: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4")
        streamer = AVPlayer (url: streamURL! as URL)
        streamController.player = streamer
        // youtube video
        let embededString = "<iframe width=\"1920\" height=\"1080\" src=\"https://www.youtube.com/embed/hNQFjqDvPhA\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>"
        webView.loadHTMLString(embededString, baseURL: nil)
     }

    @IBAction func playVideo(_ sender: Any) {
        present(playerController, animated: true, completion: {
            self.playerController.player?.play()
        })
    }
    
    @IBAction func streamVideo(_ sender: Any) {
        present(streamController, animated: true, completion: {
            self.streamController.player?.play()
        })

    }
    
}

