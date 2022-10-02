//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var timer = Timer()
    var secondsRemaining = 0
    var eggTime = ["Soft":3, "Medium":4, "Hard":7]
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func selectedHardness(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0
        secondsRemaining = eggTime [sender.currentTitle!]! - 1
        
        var secondsUsed = 0
                self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            
            if self.secondsRemaining > 0 {
                
                self.titleLabel.text = ("\(self.secondsRemaining) segundos")
                self.secondsRemaining -= 1
                secondsUsed += 1
                progressBar.progress = Float(secondsUsed) / Float(eggTime [sender.currentTitle!]!)
               
            } else {
                Timer.invalidate()
                self.titleLabel.text = "¡HECHO!"
                progressBar.progress = 1
                playSound(soundName: "alarm_sound")
                
            }
        }
    }
       

}


