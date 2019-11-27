//
//  Levels.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/26/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

let switcher = SwitchOffBrain()

func level1() {
    switcher.gridSwitches[7].isOn = true
    switcher.gridSwitches[11].isOn = true
    switcher.gridSwitches[12].isOn = true
    switcher.gridSwitches[13].isOn = true
    switcher.gridSwitches[17].isOn = true
}
func level2() {
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
