//
//  CollectionViewController.swift
//  BigCats
//
//  Created by Terry Dengis on 12/27/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var items = [[String:String]] ()
    
    func loadPlist () ->[[String:String]] {
        
        let path = Bundle.main.path(forResource: "BigCats", ofType: "plist")
        
        
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false


        // Do any additional setup after loading the view.
        items = loadPlist()
        self.navigationItem.title = "Big Cats"
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let detail = segue.destination as! ViewController
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let item = self.items[indexPath.row]
                
                detail.sentData1 = item["Name"]
                detail.sentData2 = item["Image"]
                detail.sentData3 = item["Life Span"]
                detail.sentData4 = item["Description"]

            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        let item = items[indexPath.row]
        cell.cellImageView.image = UIImage (named: item["Image"]!)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize : CGRect = UIScreen.main.bounds
        var widthCell = 0
        var heightCell = 0
        
        // iPhone X, 6, 7, 8
        if screenSize.width == 375 {
            widthCell = 172
            heightCell = 125
        }
        
        // iPhone 6+, 7+, 8+
        if screenSize.width == 414 {
            widthCell = 191
            heightCell = 125
        }
        
        // iPhone all others
        if screenSize.width == 320 {
            widthCell = 144
            heightCell = 125
        }

        return CGSize (width: widthCell, height: heightCell)
    }
}
