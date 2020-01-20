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
//    var neighborSwitches = [Int]()
    var gridSwitches = [UISwitch]()
    var switchStates = [Bool]()
    let switchRange = 1...25
    var flipCount = 0
    var currentLevel = 1
    let impact = UIImpactFeedbackGenerator()
    
    func randomToggle() -> Int {
        return Int.random(in: 0...24)
    }
    
    func flipToggle(_ toggle: UISwitch) {
        if toggle.isOn == true  {
            toggle.isOn = false
        } else {
            toggle.isOn = true
        }
    }
    
    func changeGridStatus() {
        for toggle in switchRange {
            gridSwitches[toggle].isEnabled.toggle()
        }
    }
    
    func winCheck() -> Bool {
        var win = false
        for toggle in gridSwitches {
            switchStates.append(toggle.isOn)
        }
        if switchStates.contains(true) {
        } else {
            win = true
        }
        return win
    }
    
    func getToggleStates() -> [Bool] {
        for toggle in gridSwitches {
            switchStates.append(toggle.isOn)
        }
        return switchStates
    }

    func switchFlipped(senderTag: Int) {
        var surroundingSwitches = [senderTag - 1, senderTag + 1, senderTag - 5, senderTag + 5]
        for toggle in surroundingSwitches {
            
            if toggle % 5 == 0 {
                surroundingSwitches.remove(at: 1)
            }
            else if toggle % 5 == 1 {
                surroundingSwitches.remove(at: 0)
            }
        }
        
        for toggle in surroundingSwitches {
            if switchRange.contains(toggle) {
                flipToggle(gridSwitches[toggle - 1])
            }
        }
    }
    static let disabledToggles = [0,1,2,3,4,5,6,8,9,10,14,15,16,18,19,20,21,22,23,24]
    func startGameState() {
        for toggle in SwitchOffBrain.disabledToggles {
            if gridSwitches[toggle].isHidden == false {
            gridSwitches[toggle].isHidden = true
            }
        }
    }
    func gameHasBegun() {
        for toggle in SwitchOffBrain.disabledToggles {
            if gridSwitches[toggle].isHidden == true {
            gridSwitches[toggle].isHidden = false
            }
        }
    }
    func loadLevelSwitches(toggles: [Int]) {
        for toggle in toggles {
            gridSwitches[toggle].isOn = true
        }
    }
}
