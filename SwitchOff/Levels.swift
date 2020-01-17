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
            let toggles = [10,12,14]
            for toggle in toggles {
                switcher.gridSwitches[toggle].isOn = true
            }
//            switcher.gridSwitches[10].isOn = true
//            switcher.gridSwitches[12].isOn = true
//            switcher.gridSwitches[14].isOn = true
        }
        func level3() {
            let toggles = [6,16,18,8]
            for toggle in toggles {
                switcher.gridSwitches[toggle].isOn = true
            }
        }
    }
}
