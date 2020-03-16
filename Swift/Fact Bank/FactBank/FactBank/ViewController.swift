//
//  ViewController.swift
//  FactBank
//
//  Created by Aaron Caines on 28/06/2018.
//  Copyright © 2018 Aaron Caines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func randomFact(_ sender: Any) {
        
        let array = ["""
                   The average person walks the equivalent of 5 laps around the world during their lifetime.
                   """,
                     
                     """
                   In 1992, 29,000 rubber ducks were lost at sea, and they are still being discovered in unexpected places.
                   """,
                     
                     """
                   The average bolt of lightning contains enough energy to toast 100,000 pieces of bread.
                   """,
                     
                     """
                   Bananas are more effective in replenishing electrolytes than Gatorade. They also have serotonin and dopamine—chemicals that help you feel happy.
                   """,
                     
                     """
                   3 out of 4 Americans use an emoji in text messaging every single day.
                   """]
        
        let randomFact = Int.random(in: 0 ..< array.count)
        label.text = array[randomFact]
        
    }
    

}

