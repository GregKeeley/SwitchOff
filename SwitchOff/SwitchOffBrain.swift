//
//  SwitchOffBrain.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class SwitchOffBrain {
    
    var neighborleft = Int()
    var neighborRight = Int()
    var neighborDown = Int()
    var neighborUp = Int()
    
    var neighborSwitches = [Int]()
    
    var gridSwitches = [UISwitch]()
    var switchStates = [Bool]()
    
    func getNeighborTag(toggle: UISwitch) {
        neighborleft = toggle.tag - 1
        neighborRight = toggle.tag + 1
        neighborDown = toggle.tag + 5
        neighborUp = toggle.tag - 5
        neighborSwitches.append(neighborUp)
        neighborSwitches.append(neighborRight)
        neighborSwitches.append(neighborleft)
        neighborSwitches.append(neighborDown)
        print(neighborSwitches, neighborUp, neighborDown, neighborRight, neighborleft)
        clearSwitchArray()
    }
    func clearSwitchArray() {
        neighborSwitches.removeAll()
    }
    
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
        
        gridSwitches[0].isOn = true
        
        gridSwitches[0].isOn = false
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[1].isOn = true
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[1].isOn = false
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[2].isOn = true
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[2].isOn = false
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[3].isOn = true
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[3].isOn = false
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[4].isOn = true
//        sleep(UInt32(CGFloat(0.50)))
//        gridSwitches[4].isOn = false
    }
}
