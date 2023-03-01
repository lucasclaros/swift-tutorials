//
//  ViewController.swift
//  ColorPickerApp
//
//  Created by Lucas da Silva Claros on 28/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSwitches()
            
        colorView.layer.borderWidth = 3
        colorView.layer.cornerRadius = 10
        colorView.layer.borderColor = UIColor.black.cgColor
        
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.red.cgColor
        resetButton.layer.cornerRadius = 5
        
        updateSlidersControl()
        updateColor()
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        
        updateSlidersControl()
        updateColor()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        updateSlidersControl()
        updateColor()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        updateSlidersControl()
        updateColor()
    }
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    func updateSlidersControl() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    func customSwitches() {
        redSwitch.backgroundColor = .white
        redSwitch.layer.cornerRadius = 16
        greenSwitch.backgroundColor = .white
        greenSwitch.layer.cornerRadius = 16
        blueSwitch.backgroundColor = .white
        blueSwitch.layer.cornerRadius = 16
    }
}

