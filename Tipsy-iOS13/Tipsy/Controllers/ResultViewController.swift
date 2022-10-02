//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Javier Lasso on 3/4/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: CalculateViewController {
    
    @IBOutlet weak var totalPerPreson: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var split = 0
    var tip:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalPerPreson.text = String(format: "%.2f", totalBill)
        detailsLabel.text = "Split between \(split) people, with \(tip*100)% tip."
       
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
