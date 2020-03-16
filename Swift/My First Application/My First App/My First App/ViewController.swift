//
//  ViewController.swift
//  My First App
//
//  Created by Aaron Caines on 19/10/2018.
//  Copyright © 2018 Aaron Caines. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var catSound: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.imageView?.contentMode = .scaleAspectFit
        label.isHidden = true
        
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
            
        }
        
        catch {
            
            print(error)
            
        }
        
    }
    
    @IBAction func meow(_ sender: Any) {
        
        label.isHidden = false
        
        catSound.play()
        
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
        
    }
    

    @objc func hideLabel() {
        
        label.isHidden = true
        
    }

}

