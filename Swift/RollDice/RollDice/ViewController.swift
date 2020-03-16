//
//  ViewController.swift
//  RollDice
//
//  Created by Terry Dengis on 11/12/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var diceView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    @IBAction func rollDice(_ sender: Any) {
        let min = 1
        let max = 6
        
        let randomNumber = Int.random(in: min...max)
        label.text = "You rolled a \(randomNumber)"
        diceView.image = UIImage(named: "Dice\(randomNumber)")
    }
    
    

}

