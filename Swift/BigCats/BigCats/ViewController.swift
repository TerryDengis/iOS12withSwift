//
//  ViewController.swift
//  BigCats
//
//  Created by Terry Dengis on 12/27/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailLife: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    
    var sentData1: String!
    var sentData2: String!
    var sentData3: String!
    var sentData4: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = sentData1
        detailImageView.image = UIImage(named: sentData2)
        detailTitle.text = sentData1
        detailLife.text = sentData3
        detailDescription.text = sentData4
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
