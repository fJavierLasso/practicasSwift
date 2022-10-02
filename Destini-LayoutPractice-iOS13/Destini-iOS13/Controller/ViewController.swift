//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var storyText: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var acceso2: UIButton!
    var storyBrain = StoryBrain()
    
    func updateUI(){
        
        storyText.text = storyBrain.getStoryText()
        button1.setTitle(storyBrain.getStoryOptions(button: 1), for: .normal)
        button2.setTitle(storyBrain.getStoryOptions(button: 2), for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyText.text = storyBrain.getStoryText()
        button1.titleLabel?.numberOfLines = 0
        button1.titleLabel?.adjustsFontSizeToFitWidth = true
        button1.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button2.titleLabel?.numberOfLines = 0
        button2.titleLabel?.adjustsFontSizeToFitWidth = true
        button2.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button1.setTitle(storyBrain.getStoryOptions(button: 1), for: .normal)
        button2.setTitle(storyBrain.getStoryOptions(button: 2), for: .normal)
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            UIView.animate(withDuration: 0.2) {
                sender.alpha = 1.0
            }
        }
        
        storyBrain.buttonPressed(button: sender.currentTitle!)
        storyText.text = storyBrain.getStoryText()
        updateUI()
    }
}


