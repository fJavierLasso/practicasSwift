//
//  WeatherModel.swift
//  Clima
//
//  Created by Javier Lasso on 19/5/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString:String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName:String {
        switch conditionId {
        case 1 ... 232:
            return "cloud.bolt.rain"
        case 233 ... 321:
            return "cloud.drizzle"
        case 500 ... 531:
            return "cloud.heavyrain"
        case 600 ... 622:
            return "cloud.snow"
        case 700 ... 781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801 ... 804:
            return "cloud"
        default:
            return "xmark.octagon"
        }
    }
}


