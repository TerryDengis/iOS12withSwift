//
//  ViewController.swift
//  PlayingSounds
//
//  Created by Terry Dengis on 1/24/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var soundEffect = AVAudioPlayer ()
    var musicEffect = AVAudioPlayer ()

    @IBOutlet weak var volumeSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let soundFile = Bundle.main.path(forResource: "Sound", ofType: "wav")
        let musicFile = Bundle.main.path(forResource: "Music", ofType: "mp3")

        do {
            try soundEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        } catch {
            print (error)
        }
        do {
            try musicEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
        } catch {
            print (error)
        }
    }

    @IBAction func playSound(_ sender: Any) {
        soundEffect.play()
    }
    
    @IBAction func playMusic(_ sender: Any) {
        musicEffect.play()
    }
    
    @IBAction func pauseMusic(_ sender: Any) {
        musicEffect.stop()
    }
    
    @IBAction func restartMusic(_ sender: Any) {
        musicEffect.currentTime = 0
    }
    
    @IBAction func stopMusic(_ sender: Any) {
        musicEffect.stop()
        musicEffect.currentTime = 0
    }
    
    @IBAction func volume(_ sender: Any) {
        soundEffect.volume = volumeSlider.value
        musicEffect.volume = volumeSlider.value
    }
}

