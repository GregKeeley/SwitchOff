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
    func checkAllSwitches(){
        for toggle in gridSwitches {
            if toggle.isOn == false {
                print("Win")
            } else {
                print("Keep going.. or try again")
            }
        }
    }
    func level_1_1(_ toggle: [UISwitch]) {
        gridSwitches[11].isOn = true
        gridSwitches[13].isOn = true
        gridSwitches[7].isOn = true
        gridSwitches[17].isOn = true
//        checkAllSwitches()
    }
}
