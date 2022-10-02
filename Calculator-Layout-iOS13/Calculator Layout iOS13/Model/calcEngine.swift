//
//  calcEngine.swift
//  Calculator Layout iOS13
//
//  Created by Javier Lasso on 26/04/2021.
//  Copyright © 2021 Lassapps. All rights reserved.
//

import Foundation

extension Double {
    var shortValue: String {
        return String(format: "%g", self)
    }
}

struct CalcEngine {
    
    var operador: String?
    var firstInput: Double?
    var secondInput: Double?
    var result:Double = 0
    var resultClean:String?
    var checkAdvance: Bool = true
    var resultOutlet: Double?
    
    func debugLine() {
        print ("First input: \(String(describing: firstInput))")
        print ("Second input: \(String(describing: secondInput))")
        print ("Operator: \(String(describing: operador))")
        print ("Result: \(result)")
    }
    
    mutating func refreshResultClean(){
        resultClean = resultOutlet?.shortValue
    }
    mutating func resetAll() {
        operador = ""
        firstInput = nil
        secondInput = nil
        result = 0
    }
    
    mutating func operate() {
        
        if operador != nil && firstInput != nil && secondInput != nil{
            switch operador {
            case "+":
                result = firstInput! + secondInput!
                resultClean = result.shortValue
            case "-":
                result = firstInput! - secondInput!
                resultClean = result.shortValue
            case "×":
                result = firstInput! * secondInput!
                resultClean = result.shortValue
            case "÷":
                result = firstInput! / secondInput!
                resultClean = result.shortValue
            default:
                result = 01234.567
            }
        }
    }
    
   mutating func resolve() {
        
        if firstInput != nil && secondInput != nil {
        
            firstInput = result
            secondInput = resultOutlet
            operate()
        }
        
        if firstInput == nil {
          firstInput = resultOutlet
            
        } else if secondInput == nil {
           secondInput = resultOutlet
           operate()
        }
        
        checkAdvance = false
    
        if firstInput != nil && secondInput != nil {
            resultOutlet = result
        }
    }
    

    
}
