//
//  ViewController.swift
//  nDot
//
//  Created by Javier Lasso on 16/3/22.
//

import Cocoa

class ViewController: NSViewController {
    
    private var statusItem: NSStatusItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
                    button.image = NSImage(systemSymbolName: "1.circle", accessibilityDescription: "1")
                }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    
    
   
 

}

