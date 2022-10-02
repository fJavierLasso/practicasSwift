//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightValueIndicator: UILabel!
    @IBOutlet weak var weightValueIndicator: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 1.5
        weightSlider.value = 100
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        
        let currentHeightValue = String(format: "%.2f", Float(sender.value))
        heightValueIndicator.text = "\(currentHeightValue)m"
        
       }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        
        let currentWeightValue = Int(sender.value)
        weightValueIndicator.text = String("\(currentWeightValue)kg")
        
       }
    
    @IBAction func calculateButton(_ sender: UIButton) {
       
       calBrain.calculateTMB(h: heightSlider.value, w: weightSlider.value)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tmbResult = calBrain.getTMBValue()
            destinationVC.advice = calBrain.getAdvice()
            destinationVC.color = calBrain.getColor()
        }
    }
}

