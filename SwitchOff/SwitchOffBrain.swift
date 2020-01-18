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
    
    //MARK: Levels
    func loadLevelSwitches(toggles: [Int]) {
        for toggle in toggles {
            gridSwitches[toggle].isOn = true
        }
    }
    func level0() {
        let toggles = [7,11,12,13,17]
        loadLevelSwitches(toggles: toggles)
    }
    func level1() {
        gridSwitches[7].isOn = true
        gridSwitches[11].isOn = true
        gridSwitches[12].isOn = true
        gridSwitches[13].isOn = true
        gridSwitches[17].isOn = true
    }
    func level2() {
        gridSwitches[10].isOn = true
        gridSwitches[12].isOn = true
        gridSwitches[14].isOn = true
    }
    func level3() {
        gridSwitches[6].isOn = true
        gridSwitches[16].isOn = true
        gridSwitches[18].isOn = true
        gridSwitches[8].isOn = true
    }
    func level4() {
        gridSwitches[15].isOn = true
        gridSwitches[16].isOn = true
        gridSwitches[21].isOn = true
        gridSwitches[3].isOn = true
        gridSwitches[8].isOn = true
        gridSwitches[9].isOn = true
        gridSwitches[12].isOn = true
    }
    func level5() {
        gridSwitches[10].isOn = true
        gridSwitches[15].isOn = true
        gridSwitches[20].isOn = true
        gridSwitches[4].isOn = true
        gridSwitches[9].isOn = true
        gridSwitches[14].isOn = true
        gridSwitches[6].isOn = true
        gridSwitches[18].isOn = true
    }
    func level6() {
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
    }
    func level7() {
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        
        
    }
    func level8() {
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        
    }
    func level9() {
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        
    }
    func level10() {
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        gridSwitches[randomToggle()].isOn = true
        
    }
}

// MARK: Animations
extension SwitchOffBrain {
    func resetAnimation() {
        let switchMatrix = gridSwitches
        impact.impactOccurred()
        switchMatrix[0].isOn = true
        switchMatrix[5].isOn = true
        switchMatrix[10].isOn = true
        switchMatrix[15].isOn = true
        switchMatrix[20].isOn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
            self.impact.impactOccurred()
            switchMatrix[0].isOn = false
            switchMatrix[5].isOn = false
            switchMatrix[10].isOn = false
            switchMatrix[15].isOn = false
            switchMatrix[20].isOn = false
            switchMatrix[1].isOn = true
            switchMatrix[6].isOn = true
            switchMatrix[11].isOn = true
            switchMatrix[16].isOn = true
            switchMatrix[21].isOn = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                self.impact.impactOccurred()
                switchMatrix[1].isOn = false
                switchMatrix[6].isOn = false
                switchMatrix[11].isOn = false
                switchMatrix[16].isOn = false
                switchMatrix[21].isOn = false
                switchMatrix[2].isOn = true
                switchMatrix[7].isOn = true
                switchMatrix[12].isOn = true
                switchMatrix[17].isOn = true
                switchMatrix[22].isOn = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                    self.impact.impactOccurred()
                    switchMatrix[2].isOn = false
                    switchMatrix[7].isOn = false
                    switchMatrix[12].isOn = false
                    switchMatrix[17].isOn = false
                    switchMatrix[22].isOn = false
                    switchMatrix[3].isOn = true
                    switchMatrix[8].isOn = true
                    switchMatrix[13].isOn = true
                    switchMatrix[18].isOn = true
                    switchMatrix[23].isOn = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                        self.impact.impactOccurred()
                        switchMatrix[3].isOn = false
                        switchMatrix[8].isOn = false
                        switchMatrix[13].isOn = false
                        switchMatrix[18].isOn = false
                        switchMatrix[23].isOn = false
                        switchMatrix[4].isOn = true
                        switchMatrix[9].isOn = true
                        switchMatrix[14].isOn = true
                        switchMatrix[19].isOn = true
                        switchMatrix[24].isOn = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                            self.impact.impactOccurred()
                            switchMatrix[4].isOn = false
                            switchMatrix[9].isOn = false
                            switchMatrix[14].isOn = false
                            switchMatrix[19].isOn = false
                            switchMatrix[24].isOn = false
                        }
                    }
                }
            }
        }
    }
    
    func winAnimation() {
        let delay = 0.05
        let switchMatrix = gridSwitches
        switchMatrix[0].isOn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            switchMatrix[0].isOn = false
            switchMatrix[1].isOn = true
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                switchMatrix[1].isOn = false
                switchMatrix[2].isOn = true
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    switchMatrix[2].isOn = false
                    switchMatrix[3].isOn = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        switchMatrix[3].isOn = false
                        switchMatrix[4].isOn = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                            switchMatrix[4].isOn = false
                            switchMatrix[9].isOn = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                switchMatrix[9].isOn = false
                                switchMatrix[14].isOn = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                    switchMatrix[14].isOn = false
                                    switchMatrix[19].isOn = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                        switchMatrix[19].isOn = false
                                        switchMatrix[24].isOn = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                            switchMatrix[24].isOn = false
                                            switchMatrix[23].isOn = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                switchMatrix[23].isOn = false
                                                switchMatrix[22].isOn = true
                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                    switchMatrix[22].isOn = false
                                                    switchMatrix[21].isOn = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                        switchMatrix[21].isOn = false
                                                        switchMatrix[20].isOn = true
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                            switchMatrix[20].isOn = false
                                                            switchMatrix[15].isOn = true
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                switchMatrix[15].isOn = false
                                                                switchMatrix[10].isOn = true
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                    switchMatrix[10].isOn = false
                                                                    switchMatrix[5].isOn = true
                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                        switchMatrix[5].isOn = false
                                                                        switchMatrix[6].isOn = true
                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                            switchMatrix[6].isOn = false
                                                                            switchMatrix[7].isOn = true
                                                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                switchMatrix[7].isOn = false
                                                                                switchMatrix[8].isOn = true
                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                    switchMatrix[8].isOn = false
                                                                                    switchMatrix[13].isOn = true
                                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                        switchMatrix[13].isOn = false
                                                                                        switchMatrix[18].isOn = true
                                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                            switchMatrix[18].isOn = false
                                                                                            switchMatrix[17].isOn = true
                                                                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                                switchMatrix[17].isOn = false
                                                                                                switchMatrix[16].isOn = true
                                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                                    switchMatrix[16].isOn = false
                                                                                                    switchMatrix[11].isOn = true
                                                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                                        switchMatrix[11].isOn = false
                                                                                                        switchMatrix[12].isOn = true
                                                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                                                                                            switchMatrix[12].isOn = false
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
