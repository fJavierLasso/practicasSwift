//
//  tipsyBrain.swift
//  Tipsy
//
//  Created by Javier Lasso on 3/4/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    var introducedAmount:Float = 0
    var introducedTip:Float = 0.1
    var introducedSplit:Int = 2
    
    func calculateTotal() -> Float {
        
        return (introducedAmount * (1+introducedTip)) / Float(introducedSplit)
        
    }
    
}
