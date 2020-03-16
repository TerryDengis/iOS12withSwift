//
//  ViewController.swift
//  AnimalSoundBoard
//
//  Created by Terry Dengis on 1/24/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    var soundEffect1 = AVAudioPlayer ()
    var soundEffect2 = AVAudioPlayer ()
    var soundEffect3 = AVAudioPlayer ()
    var soundEffect4 = AVAudioPlayer ()
    var soundEffect5 = AVAudioPlayer ()
    var soundEffect6 = AVAudioPlayer ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button1.imageView?.contentMode = .scaleAspectFit
        button2.imageView?.contentMode = .scaleAspectFit
        button3.imageView?.contentMode = .scaleAspectFit
        button4.imageView?.contentMode = .scaleAspectFit
        button5.imageView?.contentMode = .scaleAspectFit
        button6.imageView?.contentMode = .scaleAspectFit
        let soundFile1 = Bundle.main.path(forResource: "Cat", ofType: "wav")
        do {
            try soundEffect1 = AVAudioPlayer (contentsOf: URL(fileURLWithPath: soundFile1!))
        } catch {
            print (error)
        }
        let soundFile2 = Bundle.main.path(forResource: "Dog", ofType: "wav")
        do {
            try soundEffect2 = AVAudioPlayer (contentsOf: URL(fileURLWithPath: soundFile2!))
        } catch {
            print (error)
        }
        let soundFile3 = Bundle.main.path(forResource: "Frog", ofType: "wav")
        do {
            try soundEffect3 = AVAudioPlayer (contentsOf: URL(fileURLWithPath: soundFile3!))
        } catch {
            print (error)
        }
        let soundFile4 = Bundle.main.path(forResource: "Horse", ofType: "mp3")
        do {
            try soundEffect4 = AVAudioPlayer (contentsOf: URL(fileURLWithPath: soundFile4!))
        } catch {
            print (error)
        }
        let soundFile5 = Bundle.main.path(forResource: "Pig", ofType: "wav")
        do {
            try soundEffect5 = AVAudioPlayer (contentsOf: URL(fileURLWithPath: soundFile5!))
        } catch {
            print (error)
        }
        let soundFile6 = Bundle.main.path(forResource: "Sheep", ofType: "wav")
        do {
            try soundEffect6 = AVAudioPlayer (contentsOf: URL(fileURLWithPath: soundFile6!))
        } catch {
            print (error)
        }
    }

    @IBAction func cat(_ sender: Any) {
        soundEffect1.play()
    }
    
    @IBAction func dog(_ sender: Any) {
        soundEffect2.play()
    }
    
    @IBAction func frog(_ sender: Any) {
        soundEffect3.play()
    }
    
    @IBAction func horse(_ sender: Any) {
        soundEffect4.play()
    }
    
    @IBAction func pig(_ sender: Any) {
        soundEffect5.play()
    }
    
    @IBAction func sheep(_ sender: Any) {
        soundEffect6.play()

    }
    
    @IBAction func volume(_ sender: Any) {
        soundEffect1.volume = volumeSlider.value
        soundEffect2.volume = volumeSlider.value
        soundEffect3.volume = volumeSlider.value
        soundEffect4.volume = volumeSlider.value
        soundEffect5.volume = volumeSlider.value
        soundEffect6.volume = volumeSlider.value
    }
    
}

