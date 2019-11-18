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
    
    
    
    var switchRange = 1...25
    
    
    @IBAction func switchFlipped(_ sender: UISwitch) {
        let toggleRight = sender.tag + 1
        let toggleLeft = sender.tag - 1
        let toggleDown = sender.tag + 5
        let toggleUp = sender.tag - 5
        let toggles = [toggleLeft, toggleRight, toggleUp, toggleDown]
        //switcher.getNeighborTag(toggle: sender)
        if sender.isOn == true {
            print("Sender: \(sender.tag) toggles: \(toggles)")
            for toggle in toggles {
                if switchRange.contains(toggle) {
                    switchGrid[toggle].isOn = false
                } else {
                    print("\(toggle) is out of range")
                }
            }
        } else {
            print("Sender: \(sender.tag) toggles: \(toggles)")
            for toggle in toggles {
                if switchRange.contains(toggle) {
                    switchGrid[toggle].isOn = true
                } else {
                    print("\(toggle) is out of range")
                }
            }
        }
    }
    
}
