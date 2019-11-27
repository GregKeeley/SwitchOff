//
//  SwitchOffBrain.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class SwitchOffBrain {
    
    var neighborLeft = Int()
    var neighborRight = Int()
    var neighborDown = Int()
    var neighborUp = Int()
    
    var neighborSwitches = [Int]()
    
    var gridSwitches = [UISwitch]()
    var switchStates = [Bool]()
    
    var switchRange = 1...25
    
    func flipToggle(_ toggle: UISwitch) {
        if toggle.isOn == true  {
            toggle.isOn = false
        } else {
            toggle.isOn = true
        }
    }
    
    func checkAllSwitches() -> Bool {
        for toggle in gridSwitches {
            if toggle.isOn == false {
                winAnimation()
                return true
            } else {
                print()
            }
        }
        return false
    }
    
    func level_1_1(_ toggle: [UISwitch]) {
        gridSwitches[11].isOn = true
        gridSwitches[13].isOn = true
        gridSwitches[7].isOn = true
        gridSwitches[17].isOn = true
        //        checkAllSwitches()
    }
    
    func getToggleStates() -> [Bool] {
        for toggle in gridSwitches {
            switchStates.append(toggle.isOn)
        }
        return switchStates
    }
    
    func winAnimation() {
    }
    
    
    func switchFlipped(senderTag: Int) {
        neighborRight = senderTag + 1
        neighborLeft = senderTag - 1
        neighborDown = senderTag + 5
        neighborUp = senderTag - 5
        neighborSwitches.append(neighborLeft)
        neighborSwitches.append(neighborRight)
        neighborSwitches.append(neighborUp)
        neighborSwitches.append(neighborDown)
        for toggle in neighborSwitches {
            
            if toggle % 5 == 0 {
                neighborSwitches.remove(at: 1)
            }
            else if toggle % 5 == 1 {
                neighborSwitches.remove(at: 0)
            }
        }
        
        for toggle in neighborSwitches {
            if switchRange.contains(toggle) {
                flipToggle(gridSwitches[toggle - 1])
            }
        }
    }
    
    
}
