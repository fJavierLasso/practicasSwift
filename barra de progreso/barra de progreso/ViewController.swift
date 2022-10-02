//
//  ViewController.swift
//  barra de progreso
//
//  Created by Javier Lasso on 6/3/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var barraProgreso: UIProgressView!
    
    var timer = Timer()
    var secondsRemaining = 0
    var tiempoInicial = 10
    
    @IBAction func boton(_ sender: UIButton) {
        
        timer.invalidate()
        barraProgreso.progress = 0
        secondsRemaining = tiempoInicial - 1
        
        var secondsUsed = 0
                self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            
            if self.secondsRemaining > 0 {
                
                self.secondsRemaining -= 1
                secondsUsed += 1
                barraProgreso.progress = Float(secondsUsed) / Float(tiempoInicial)
               
            } else {
                Timer.invalidate()
                barraProgreso.progress = 1
                
                
            }
        }
    }
    
}

