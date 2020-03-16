//
//  ViewController.swift
//  TrafficLight
//
//  Created by Terry Dengis on 11/12/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var trafficLightImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var startTimer = Timer ()
    var scoreTimer = Timer ()
    var timerInt = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        score = 0
        
    }

    
    @IBAction func startGame(_ sender: Any) {
        
        if score == 0 {
            timerInt = 3
            trafficLightImage.image = UIImage (named: "trafficLight3")
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdownImage), userInfo: nil, repeats: true)
            startStopButton.isEnabled = false
            startStopButton.setTitle ("", for: .normal)
            label.text = String (score)
            
        } else {
            scoreTimer.invalidate()
            startStopButton.isEnabled = true
            score = 0
            startStopButton.setTitle ("Restart", for: .normal)

        }
    }
    
    @objc func updateCountdownImage () {
        timerInt -= 1
        
        switch timerInt {
        case 2:
            trafficLightImage.image = UIImage (named: "trafficLight3")
            
        case 1:
            trafficLightImage.image = UIImage (named: "trafficLight2")
            
        case 0:
            trafficLightImage.image = UIImage (named: "trafficLight1")
            startTimer.invalidate()
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateScore), userInfo: nil, repeats: true)
            startStopButton.isEnabled = true
            startStopButton.setTitle ("Stop", for: .normal)

        default:
            print ("this should never get printed .....")
        }
    }
    
    @objc func updateScore () {
        score += 1
        label.text = String (score)
    }

}

