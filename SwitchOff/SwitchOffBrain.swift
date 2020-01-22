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
    static let disabledToggles = [0,1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,24]
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
    func loadLevelArray(currentLevel: Int) -> [Int] {
        switch currentLevel {
//        case 0:
//            loadLevelSwitches(toggles: levels.level0)
//            return levels.level0
        case 1:
            loadLevelSwitches(toggles: levels.level1)
            return levels.level1
        case 2:
            loadLevelSwitches(toggles: levels.level2)
            return levels.level2
        case 3:
            loadLevelSwitches(toggles: levels.level3)
            return levels.level3
        case 4:
            loadLevelSwitches(toggles: levels.level4)
            return levels.level4
        case 5:
            loadLevelSwitches(toggles: levels.level5)
            return levels.level5
        case 6:
            loadLevelSwitches(toggles: levels.level6)
            return levels.level6
        case 7:
            loadLevelSwitches(toggles: levels.level7)
            return levels.level7
        case 8:
            loadLevelSwitches(toggles: levels.level8)
            return levels.level8
        case 9:
            loadLevelSwitches(toggles: levels.level9)
            return levels.level9
        case 10:
            loadLevelSwitches(toggles: levels.level10)
            return levels.level10
        case 11:
            loadLevelSwitches(toggles: levels.level11)
            return levels.level11
        case 12:
            loadLevelSwitches(toggles: levels.level12)
            return levels.level12
        case 13:
            loadLevelSwitches(toggles: levels.level13)
            return levels.level13
        case 14:
            loadLevelSwitches(toggles: levels.level14)
            return levels.level14
        case 15:
            loadLevelSwitches(toggles: levels.level15)
            return levels.level15
        case 16:
            loadLevelSwitches(toggles: levels.level16)
            return levels.level16
        case 17:
            loadLevelSwitches(toggles: levels.level17)
            return levels.level17
        case 18:
            loadLevelSwitches(toggles: levels.level18)
            return levels.level18
        case 19:
            loadLevelSwitches(toggles: levels.level19)
            return levels.level19
        case 20:
            loadLevelSwitches(toggles: levels.level20)
            return levels.level20
        case 21:
            loadLevelSwitches(toggles: levels.level21)
            return levels.level21
        case 22:
            loadLevelSwitches(toggles: levels.level22)
            return levels.level22
        case 23:
            loadLevelSwitches(toggles: levels.level23)
            return levels.level23
        case 24:
            loadLevelSwitches(toggles: levels.level24)
            return levels.level24
        case 25:
            loadLevelSwitches(toggles: levels.level25)
            return levels.level25
        default:
            break
        }
        return [0]
    }
}

