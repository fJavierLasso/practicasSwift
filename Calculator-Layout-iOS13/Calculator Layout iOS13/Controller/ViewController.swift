//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Javier Lasso on 26/04/2021.
//  Copyright © 2021 Lassapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var substractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var calEngine = CalcEngine()
    var intEngine = InterfaceEngine()
    var hasTyped = false
    var dotPressed = false
    
    func restoreOperatorColors() {
        divideButton.backgroundColor = #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
        multiplyButton.backgroundColor = #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
        addButton.backgroundColor = #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
        substractButton.backgroundColor = #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
    }
    
    @IBAction func numericInput(_ sender: UIButton) {
        
        intEngine.briefFadeNumeric(target: sender)
        
        if divideButton.backgroundColor == #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
            && multiplyButton.backgroundColor == #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
            && addButton.backgroundColor == #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
            && substractButton.backgroundColor == #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
            && calEngine.firstInput != nil
            && calEngine.secondInput != nil
            && calEngine.operador != nil {
            
            calEngine.resetAll()
        }
        
        if resultOutlet.text == "0" || calEngine.checkAdvance == false {
            if sender.currentTitle == "." {
                resultOutlet.text = "0."
                calEngine.checkAdvance = true
                return
            }
            
            resultOutlet.text = ""
            calEngine.checkAdvance = true
        }
    
        if sender.currentTitle == "." && dotPressed == true {
            return
        }
        
        if resultOutlet.text!.count <= 11 {
            resultOutlet.text! += sender.currentTitle!
            calEngine.resultOutlet = Double(resultOutlet.text ?? "0")
            hasTyped = true
        }
        
        if sender.currentTitle == "." {
            dotPressed = true
        }
     }

    @IBAction func operateInput(_ sender: UIButton) {
        
        restoreOperatorColors()
        dotPressed = false
        
        if sender.currentTitle != "=" {
            sender.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            intEngine.playSound(sound: "operationSound")
        } else {
            intEngine.briefFadeResult(target: sender)
        }
      
        if hasTyped == true {
            
            calEngine.resolve()
            hasTyped = false
        }
        
        calEngine.operador = sender.currentTitle!
       
        if calEngine.secondInput != nil {
            resultOutlet.text = calEngine.resultClean
        }
    }
    
    @IBAction func deleteAll(_ sender: UIButton) {
        
        intEngine.briefFadeGray(target: sender)
        restoreOperatorColors()
        calEngine.resetAll()
        resultOutlet.text = "0"
        dotPressed = false
    }
    
    @IBAction func modifyerTriggers(_ sender: UIButton) {
        
        intEngine.briefFadeGray(target: sender)
        
        if calEngine.resultOutlet != nil && calEngine.result != 0 {
            switch sender.currentTitle {
            case "+/-":
                calEngine.resultOutlet! *= -1
                calEngine.refreshResultClean()
                resultOutlet.text = calEngine.resultClean
            case "%":
                calEngine.resultOutlet! /= 100
                calEngine.refreshResultClean()
                resultOutlet.text = calEngine.resultClean
            default:
                print ("modifyerError")
            }
        }
    }
}

