//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Javier Lasso on 3/4/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var tmb: TMB?
    
    func getTMBValue() -> String {
        let tmb1decimal = String(format: "%.1f", tmb?.value ?? 0.0)
        print (tmb1decimal)
        return tmb1decimal
    }
    mutating func calculateTMB(h:Float, w:Float){
        
       let tmbValue = (w / pow(h, 2))
        
        if tmbValue < 18.5 {
            tmb = TMB(value: tmbValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if tmbValue < 24.9 {
            tmb = TMB(value: tmbValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            tmb = TMB(value: tmbValue, advice: "Eat less pies", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
        
    }
    
    func getAdvice () -> String {
        return tmb?.advice ?? "Default advice"
    }
    
    func getColor () -> UIColor {
        return tmb?.color ?? UIColor.white
    }
}
