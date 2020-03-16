//
//  ViewController.swift
//  TapMeFast
//
//  Created by Aaron Caines on 27/06/2018.
//  Copyright © 2018 Aaron Caines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    
    var timeInt = 10
    var scoreInt = 0
    var gameInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeInt = 10
        
    }

    @IBAction func startGame(_ sender: Any) {
        
        if timeInt == 10 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
            
        }
        
        if  gameInt == 1 {
            
            scoreInt += 1
            scoreLabel.text = String(scoreInt)
        } else {
            
            timeInt = 10
            scoreInt = 0
            
            timeLabel.text = String(timeInt)
            scoreLabel.text = String(scoreInt)
            
            startGameButton.setTitle("Start", for: UIControl.State.normal)
            
        }
        
        
    }
    
    
    @objc func startCounter() {
        
        timeInt -= 1
        timeLabel.text = String(timeInt)
        
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
        
        startGameButton.setTitle("Tap", for: UIControl.State.normal)
        
        gameInt = 1
        
        if timeInt == 0 {
            
            timer.invalidate()
            
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
            
            startGameButton.setTitle("Restart", for: UIControl.State.normal)
            
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
            
        }
        
    }
    
    @objc func restart() {
        
        gameInt = 0
        
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
        
    }
    
    

}

