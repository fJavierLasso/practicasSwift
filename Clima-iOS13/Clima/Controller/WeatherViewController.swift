//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

//MARK: - WeatherViewController

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func requestLocationWeather(_ sender: UIButton) {
        
        locationManager.requestLocation()
        
    }
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conditionImageView.image = nil
        temperatureLabel.text = ""
        cityLabel.text = ""
        
        //esta es la autorizacion para ubicacion necesaria para poder usar el modulo CoreLocation. hay que ir a Info.plist y añadir la nueva propiedad "privacy location when in use usage description" con un mensaje sobre para que es.
            locationManager.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestLocation()
        //Aqui digo que el textField deberá reportar a este UIcontroller. Que se comunica con este viewController, es el "delegado" del textfield para todo (desinvocar teclado, enviar con el go...
        searchTextField.delegate = self
        weatherManager.delegate = self
        searchTextField.placeholder = "Buscar"
        }
    
    
    }

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        print (searchTextField.text!)
        searchTextField.endEditing(true)
        
        }

    //estas funciones de TextFieldDelegate funcionan para el currente textfield en uso. Igual que un sender: UIButton. Dentro podremos concretar si queremos comportamientos específicos para cada botón, o podemos poner en (_textfield: ) el nombre del textfield que realmente queremos tocar.
    
    //esta función es una extensión del protocolo textfielddelegate para poder imprimir en pantalla lo que hay antes de indicarle que debe dejar de editar(?)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print (searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    //Esta función dice lo que hace el textfield en caso de que se de a enter sin haber introducido nada
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         if textField.text != "" {
             return true
         } else {
             textField.placeholder = "Escribe una ciudad"
             return false
         }
    }
    
    //Esta función dice lo que hace el textfield una vez se le da a enter después de escribir.
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        searchTextField.text = searchTextField.text?.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        searchTextField.text = searchTextField.text?.replacingOccurrences(of: "ñ", with: "n", options: .literal, range: nil)
        searchTextField.text = searchTextField.text?.replacingOccurrences(of: "á", with: "a", options: .literal, range: nil)
        searchTextField.text = searchTextField.text?.replacingOccurrences(of: "é", with: "e", options: .literal, range: nil)
        searchTextField.text = searchTextField.text?.replacingOccurrences(of: "í", with: "i", options: .literal, range: nil)
        searchTextField.text = searchTextField.text?.replacingOccurrences(of: "ó", with: "o", options: .literal, range: nil)
        searchTextField.text = searchTextField.text?.replacingOccurrences(of: "ú", with: "u", options: .literal, range: nil)
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city, latitude: 0.0, longitude: 0.0)
        }
        searchTextField.text = ""
    }

}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        //lo de DispatchQueue lo hago para decirle que haga el update de la interface una vez reciba la informacion del networking, pero que mientras, la app siga siendo usable. Asi no se nota el retraso de entrada de la información.
        DispatchQueue.main.async{
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - LocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
//this method is called by the framework on         locationManager.requestLocation();
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last {
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        weatherManager.fetchWeather(cityName: "", latitude: lat, longitude: lon)
    }
}

func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
   print("Did location updates is called but failed getting location \(error)")
    }
}
