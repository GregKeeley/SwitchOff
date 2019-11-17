//
//  AlternateViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class AlternateViewController: UIViewController {
    
    @IBOutlet var switchGrid: [UISwitch]!

    
    var switcher = SwitchOffBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for state in switchGrid {
            if state.isOn == true {
                state.isOn = false
            }
        }
    }
    

    
    
    
    
    @IBAction func switchFlipped(_ sender: UISwitch) {
        if sender.isOn == false {
            switcher.getNeighborTag(tag: sender.tag)
            switcher.clearSwitchArray()
            for toggle in switcher.neighborSwitches {
                switch toggle {
                case 0...24:
                        sender.tag = toggle
                        sender.isOn = true
                default:
                    print(toggle)
                }
            }
        }
    
            
    }
}
