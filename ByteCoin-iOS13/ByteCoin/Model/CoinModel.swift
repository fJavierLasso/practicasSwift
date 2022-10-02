//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Javier Lasso on 27/5/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    
    let rate:Double
    
    var rateString:String {
        return String(format: "%.2f", rate)
    }
}
