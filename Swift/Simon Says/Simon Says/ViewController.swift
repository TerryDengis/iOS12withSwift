//
//  ViewController.swift
//  Simon Says
//
//  Created by Terry Dengis on 12/8/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var simonLabel: UILabel!
    
    var timer = Timer ()
    var simonTimer = Timer ()
    
    var timeInt = 20
    var scoreInt = 0
    var modeInt = 0
    
    let array = ["Simon Says Swipe Right",
                 "Simon Says Swipe Left",
                 "Simon Says Swipe Up",
                 "Simon Says Swipe Down",
                 "Swipe Right",
                 "Swipe Left",
                 "Swipe Up",
                 "Swipe Down"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        simonLabel.layer.cornerRadius = 10.0
        
        let swipeRight = UISwipeGestureRecognizer (target: self, action: #selector (swipeGestures(sender:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer (target: self, action: #selector (swipeGestures(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer (target: self, action: #selector (swipeGestures(sender:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer (target: self, action: #selector (swipeGestures(sender:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        
    }


    @IBAction func startGame(_ sender: Any) {
        if timeInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector (updateTimer), userInfo: nil, repeats: true)
            
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.25
            modeInt = 1
            
            simonSays()
        }
        if timeInt == 0 {
            timeInt = 20
            timeLabel.text = "Time: \(timeInt)"
            scoreInt = 0
            scoreLabel.text = "Score: \(scoreInt)"
            simonLabel.text = "Simon Says"
            startGameButton.setTitle("Start Game", for: .normal)
        }
     }
    
    @objc func updateTimer () {
        timeInt -= 1
        timeLabel.text = "Time: " + String (timeInt)
        if timeInt == 0 {
            timer.invalidate()
            simonTimer.invalidate()
            simonLabel.text = "Game Over"
            modeInt = 0
            startGameButton.isEnabled = true
            startGameButton.alpha = 1.0
            startGameButton.setTitle("Restart Game", for: .normal)
            
        }
    }
    
    @objc func simonSays () {
        let randomWord = Int.random(in: 0 ..< array.count)
        simonLabel.text = array[randomWord]
        
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(simonSays), userInfo: nil, repeats: false)
    }
    
    @objc func swipeGestures (sender: UISwipeGestureRecognizer) {
        
        if modeInt == 1 {
            simonTimer.invalidate()
            if sender.direction == UISwipeGestureRecognizer.Direction.right {
                
                if simonLabel.text == "Simon Says Swipe Right" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                }
                
            }
            
            if sender.direction == UISwipeGestureRecognizer.Direction.left {
                
                if simonLabel.text == "Simon Says Swipe Left" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                }
                
            }

            if sender.direction == UISwipeGestureRecognizer.Direction.up {
                
                if simonLabel.text == "Simon Says Swipe Up" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                }
                
            }

            if sender.direction == UISwipeGestureRecognizer.Direction.down {
                
                if simonLabel.text == "Simon Says Swipe Down" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                }
                
            }

            simonSays()
        }
        
    }
}

