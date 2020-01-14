//
//  Levels.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/26/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

let switcher = SwitchOffBrain()
func allOtherSwitchesOff(switchArr: [UISwitch]) {
    for toggle in switchArr {
        if !switcher.gridSwitches.contains(toggle) {
            for toggle in switcher.gridSwitches {
                toggle.isOn = false
            }
        }
        
        func level1() {
            let switchesOn = [switcher.gridSwitches[7], switcher.gridSwitches[11], switcher.gridSwitches[12], switcher.gridSwitches[13], switcher.gridSwitches[17]]
            allOtherSwitchesOff(switchArr: switchesOn)
            switcher.gridSwitches[7].isOn = true
            switcher.gridSwitches[11].isOn = true
            switcher.gridSwitches[12].isOn = true
            switcher.gridSwitches[13].isOn = true
            switcher.gridSwitches[17].isOn = true
            
        }
        func level2() {
            let switchesOn = [switcher.gridSwitches[10], switcher.gridSwitches[12], switcher.gridSwitches[14]]
            allOtherSwitchesOff(switchArr: switchesOn)
            switcher.gridSwitches[10].isOn = true
            switcher.gridSwitches[12].isOn = true
            switcher.gridSwitches[14].isOn = true
        }
        func level3() {
            switcher.gridSwitches[6].isOn = true
            switcher.gridSwitches[16].isOn = true
            switcher.gridSwitches[18].isOn = true
            switcher.gridSwitches[8].isOn = true
        }
    }
}
