//
//  ViewController.swift
//  SnapAttack
//
//  Created by Terry Dengis on 12/27/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer ()
    var cardTimer = Timer ()
    var timerInt = 20
    var scoreInt = 0
    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startGame(_ sender: Any) {
        
        if timerInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            cardTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCard), userInfo: nil, repeats: true)
            startButton.isEnabled = false
            startButton.alpha = 0.25
            startButton.setTitle("Snap", for: .normal)
        }
        if gameMode == 1 {
            if firstCard.image == secondCard.image {
                scoreInt += 1
            } else {
                scoreInt -= 1
            }
            scoreLabel.text = "Score: \(scoreInt)"
        }
        
        if timerInt == 0 {
            timerInt = 20
            scoreInt = 0
            timeLabel.text = "Time: \(timerInt)"
            scoreLabel.text = "Score: \(scoreInt)"
            startButton.setTitle("Start", for: .normal)
            firstCard.image = UIImage(named: "blue_cover")
            secondCard.image = UIImage(named: "red_cover")
        }
    }
    
    @objc func updateTimer () {
        timerInt -= 1
        timeLabel.text = "Time: \(timerInt)"
        gameMode = 1
        startButton.isEnabled = true
        startButton.alpha = 1.0
        if timerInt == 0 {
            timer.invalidate()
            cardTimer.invalidate()
            startButton.setTitle("Restart", for: .normal)
            gameMode = 0
        }
    }
    
    @objc func updateCard () {
        let cardList = ["ace_of_hearts", "2_of_hearts", "3_of_hearts", "4_of_hearts", "5_of_hearts", "6_of_hearts", "7_of_hearts", "8_of_hearts", "9_of_hearts", "10_of_hearts"]
        
        firstCard.image = UIImage(named: cardList.randomElement()!)
        secondCard.image = UIImage(named: cardList.randomElement()!)
        
    }
}

