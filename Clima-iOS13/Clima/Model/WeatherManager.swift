//
//  WeatherManager.swift
//  Clima
//
//  Created by Javier Lasso on 25/4/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?APPID=ad030a901873648f3df374e8911a4245&units=metric"

    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName:String, latitude:Double, longitude:Double){
        
        if cityName != "" {
            let urlString = "\(weatherURL)&q=\(cityName)"
            performRequest(with: urlString)
        } else {
            let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
            performRequest(with: urlString)
        }

    }
    
    func performRequest(with cityName: String) {
        
        //1.Create URL
        if let url = URL(string: cityName){
            //2.Create URLSession
            let session = URLSession(configuration: .default)
            //3.Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //4.Start task
            task.resume()
            //todas las tasks están ejecutadas y en pausa por defecto, por tanto resume es iniciarla desde la primera vez.
            
        }
    }
    
    func parseJSON(_ jsonData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: jsonData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
