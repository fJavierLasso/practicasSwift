//
//  interfaceEngine.swift
//  Calculator Layout iOS13
//
//  Created by Javier Lasso on 27/4/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

struct InterfaceEngine {
    
    var player: AVAudioPlayer!
    
    mutating func playSound(sound:String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    
    mutating func briefFadeNumeric(target:UIButton){
        
        playSound(sound: "numberSound")
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .allowUserInteraction) {
             target.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
         }
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
             UIView.animate(withDuration: 0.1) {
                 target.backgroundColor = #colorLiteral(red: 0.1040845439, green: 0.6774265766, blue: 0.9741994739, alpha: 1)
             }
         }
       
    }
    
    mutating func briefFadeGray(target:UIButton){
        
        playSound(sound: "modifyerSound")
        UIView.animate(withDuration: 0.2) {
             target.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
         }
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
             UIView.animate(withDuration: 0.2) {
                 target.backgroundColor = #colorLiteral(red: 0.3373326659, green: 0.3373858333, blue: 0.3373210132, alpha: 1)
             }
         }
    }
    
    mutating func briefFadeResult(target:UIButton){
        
        playSound(sound: "resolveSound")
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .allowUserInteraction) {
            target.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
         }
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
             UIView.animate(withDuration: 0.1) {
                 target.backgroundColor =  #colorLiteral(red: 1, green: 0.5488162041, blue: 0, alpha: 1)
             }
         }
       
    }
    
    
}
