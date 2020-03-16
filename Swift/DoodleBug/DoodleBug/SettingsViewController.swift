//
//  SettingsViewController.swift
//  DoodleBug
//
//  Created by Terry Dengis on 12/28/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewControllerFinished(_ settingsViewController: SettingsViewController)
}

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var brushLabel: UILabel!
    @IBOutlet weak var brushSlider: UISlider!
    
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var opacitySlider: UISlider!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePreview()
        brushLabel.text = String (format: "Brush Sice: %.0f", brushWidth)
        brushSlider.value = Float (brushWidth)
        redSlider.value = Float (red * 255)
        redLabel.text = String (format: "%.0f/255", redSlider.value)
        greenSlider.value = Float (green * 255)
        greenLabel.text = String (format: "%.0f/255", greenSlider.value)
        blueSlider.value = Float (blue * 255)
        blueLabel.text = String (format: "%.0f/255", blueSlider.value)
        opacityLabel.text = String (format: "Opacity: %.2f", opacity)
        opacitySlider.value = Float (opacity)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func brushSize(_ sender: Any) {
        brushWidth = CGFloat (brushSlider.value)
        brushLabel.text = String (format: "Brush Sice: %.0f", brushWidth)
        updatePreview()
    }
    
    @IBAction func opacityChange(_ sender: Any) {
        opacity = CGFloat (opacitySlider.value)
        opacityLabel.text = String (format: "Opacity: %.2f", opacity)
        updatePreview()
    }
    
    @IBAction func redColor(_ sender: Any) {
        red = CGFloat (redSlider.value / 255)
        redLabel.text = String (format: "%.0f/255", redSlider.value)
        updatePreview()
    }
    
    @IBAction func greenColor(_ sender: Any) {
        green = CGFloat (greenSlider.value / 255)
        greenLabel.text = String (format: "%.0f/255", greenSlider.value)
        updatePreview()
    }
    
    @IBAction func blueColor(_ sender: Any) {
        blue = CGFloat (blueSlider.value / 255)
        blueLabel.text = String (format: "%.0f/255", blueSlider.value)
        updatePreview()
    }
    
    @IBAction func exit(_ sender: Any) {
        delegate?.settingsViewControllerFinished(self)
        dismiss(animated: true, completion: nil)
    }
    
    func updatePreview () {
        UIGraphicsBeginImageContext(imageView.frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineCap(.round)
        context?.setLineWidth(brushWidth)
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha: opacity)
        
        context?.move(to: CGPoint(x: imageView.frame.width / 2, y: imageView.frame.height / 2))
        context?.addLine(to: CGPoint(x: imageView.frame.width / 2, y: imageView.frame.height / 2))
        context?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
}
