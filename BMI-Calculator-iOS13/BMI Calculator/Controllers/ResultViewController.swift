//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Javier Lasso on 2/4/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultNumber: UILabel!
    @IBOutlet weak var resultComment: UILabel!
    
    var tmbResult = "0.0"
    var advice = "Default advice"
    var color = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultNumber.text = tmbResult
        resultComment.text = advice
        self.view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
