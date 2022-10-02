//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyResult: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    var timer = Timer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //tengo que decir de donde saca los datos y quien es el delegate del currencyPicker (también tengo que meterle al ViewController el protocol correspondiente para poderlo manejar).
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        coinManager.getCoinPrice(for: coinManager.currentCurrency)
    }
}
  


//MARK: - UIPickerView Delegate & DataSource

    extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
        //las funciones pickerView se ejecutan cada vez que se mueve el pickerview.
        
        
        //esto es el número de columnas que queremos en el picker. Obligatorio en el protocol UIPickerViewDataSource.
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        //esta función me indica el número de filas en el pickerview
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return coinManager.currencyArray.count
        }
        
        //esto espera en retorno un String que será el título de cada fila. Se ejecutará a cada fila.
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return coinManager.currencyArray[row]
            
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            timer.invalidate()
            coinManager.currentCurrency = coinManager.currencyArray[row]
            currencyLabel.text = coinManager.currentCurrency
            coinManager.getCoinPrice(for: coinManager.currentCurrency)
            scheduledTimerWithTimeInterval()
            
        }
    }
    
//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    
    func didUpdateCurrency(_ coinManager: CoinManager, currency: CoinModel) {
        DispatchQueue.main.async {
            self.currencyResult.text = currency.rateString

        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
