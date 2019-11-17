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
        let toggleRight = sender.tag + 1
                  let toggleLeft = sender.tag - 1
                  let toggleDown = sender.tag + 5
                  let toggleUp = sender.tag - 5
                  let toggles = [toggleUp, toggleDown, toggleLeft, toggleRight]
        if sender.isOn == false {
            print(switchGrid ?? "Err")
            
          
            
            print("Sender: \(sender.tag) toggles: \(toggles)")
            for toggle in toggles {
                if toggle > 0 {
                    if toggle < 24 {
                        switchGrid[toggle].isOn = true
                    }
                }
            }
        } else {
            print("Sender: \(sender.tag) toggles: \(toggles)")
            for toggle in toggles {
                if toggle > 0 {
                    if toggle < 24 {
                        switchGrid[toggle].isOn = false
                        
                        //            switcher.getNeighborTag(tag: sender.tag)
                        //            switcher.clearSwitchArray()
                        //            for toggle in switcher.neighborSwitches {
                        //                var num = switchGrid.distance(from: sender.tag, to: 1)
                        //                switcher.flipToggle([num])
                    }
                }
                
                
            }
        }
    }
}
