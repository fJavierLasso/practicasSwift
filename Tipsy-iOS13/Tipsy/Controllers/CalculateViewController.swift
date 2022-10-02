//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var ceroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    @IBOutlet weak var splitBetweenLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    var totalBill:Float = 0.0
    var tipBrain = TipsyBrain()
    
    @IBAction func selectedTipAmount(_ sender: UIButton) {
        
        textField.endEditing(true)
        
        ceroTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
        sender.isSelected = true
        
        if sender.currentTitle == "0%" {
            tipBrain.introducedTip = 0
        } else if sender.currentTitle == "10%" {
            tipBrain.introducedTip = 0.1
        } else {
            tipBrain.introducedTip = 0.2
        }
       
       }
    @IBAction func amountIntroduced(_ sender: UITextField) {
        
        tipBrain.introducedAmount = Float(textField.text!) ?? 0.0
        }
        
    @IBAction func splitBetweenStepper(_ sender: UIStepper) {
        
        textField.endEditing(true)
        
        sender.maximumValue = 100
        sender.minimumValue = 1
        
        tipBrain.introducedSplit = Int(sender.value)
        splitBetweenLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        totalBill = tipBrain.calculateTotal()
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalBill = totalBill
            destinationVC.split = tipBrain.introducedSplit
            destinationVC.tip = tipBrain.introducedTip
        }
    }

}
