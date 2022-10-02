//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ coinManager: CoinManager, currency:CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var currentCurrency = ""
    var delegate: CoinManagerDelegate?
 
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "FE05C695-01C3-4838-9741-8A5AF291146E"
    let currencyArray =
        ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency:String){
    
        if currency != "" {
            let urlString = "\(baseURL)/\(currentCurrency)?apikey=\(apiKey)"
            performRequest(with:urlString)
        }
    }
    
    func performRequest (with currency:String) {
                
        if let url = URL(string: currency) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let currency = self.parseJSON(safeData){
                        self.delegate?.didUpdateCurrency(self, currency: currency)
                    }
                }
            }
            //4.Start task
            task.resume()
        
            }
    }
    
    func parseJSON(_ jsonData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: jsonData)
            
            let rate = decodedData.rate
            print (rate)
            let coin = CoinModel(rate: rate)
            return coin
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

    
}
