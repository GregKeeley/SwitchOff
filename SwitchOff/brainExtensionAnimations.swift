//
//  brainExtensionAnimations.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 1/18/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

extension SwitchOffBrain {

    func makeImpact() {
        impact.impactOccurred(intensity: CGFloat(0.99))
    }
    func delayAction(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    func toggleOn(toggle: Int) {
            self.gridSwitches[toggle].isOn = true
        
    }
    func toggleOff(toggle: Int) {
        delayAction(0.10) {
            self.gridSwitches[toggle].isOn = false
        }
    }
    func winAnimation2() {
        let winAnimationToggles = [0,1,2,3,4,9,14,19,24,23,22,21,20,15,10,5,6,7,8,13,18,17,16,11,12]
        var toggle = 0
            repeat {
                    self.toggleOn(toggle: toggle)
                toggle += 1
                self.delayAction(0.10) {
                    self.toggleOff(toggle: toggle)
                  
                }
                print(toggle)
            } while toggle < winAnimationToggles.count
    }
    func removeLevelToggles(level: [Int], aniArray: [Int]) -> [Int] {
        var togglesToTurnOff = [Int]()
        for toggle in level {
            if !aniArray.contains(toggle) {
                togglesToTurnOff.append(toggle)
            }
        }
        return togglesToTurnOff
    }
    func resetAnimation2(level: [Int]) {
        impact.prepare()
        let row1 = [0,5,10,15,20]
        let row2 = [1,6,11,16,21]
        let row3 = [2,7,12,17,22]
        let row4 = [3,8,13,18,23]
        let row5 = [4,9,14,19,24]
        for toggle in row1 {
            gridSwitches[toggle].isOn = true
            delayAction(0.10) {
                if !level.contains(toggle) {
                self.gridSwitches[toggle].isOn = false
                }
                for toggle in row2 {
                    self.gridSwitches[toggle].isOn = true
                    self.delayAction(0.10) {
                        if !level.contains(toggle) {
                        self.gridSwitches[toggle].isOn = false
                        }
                        for toggle in row3 {
                            self.gridSwitches[toggle].isOn = true
                            self.delayAction(0.10) {
                                if !level.contains(toggle) {
                                self.gridSwitches[toggle].isOn = false
                                }
                                for toggle in row4 {
                                    self.gridSwitches[toggle].isOn = true
                                    self.delayAction(0.10) {
                                        if !level.contains(toggle) {
                                        self.gridSwitches[toggle].isOn = false
                                        }
                                        for toggle in row5 {
                                            
                                            self.gridSwitches[toggle].isOn = true
                                            self.delayAction(0.10) {
                                                if !level.contains(toggle) {
                                                self.gridSwitches[toggle].isOn = false
                                                }
                                            }
                                        }
                                    }
                                }
                                self.makeImpact()
                            }
                        }
                        self.makeImpact()
                    }
                }
                self.makeImpact()
            }
        }
    }



    func winAnimation() {
        let delay: Double = 0.05
        let switchMatrix = gridSwitches
        switchMatrix[0].isOn = true
        delayAction(delay) {
            self.makeImpact()
            switchMatrix[0].isOn = false
            switchMatrix[1].isOn = true
            self.delayAction(delay) {
                switchMatrix[1].isOn = false
                switchMatrix[2].isOn = true
                self.delayAction(delay) {
                    switchMatrix[2].isOn = false
                    switchMatrix[3].isOn = true
                    self.delayAction(delay) {
                        switchMatrix[3].isOn = false
                        switchMatrix[4].isOn = true
                        self.delayAction(delay) {
                            self.makeImpact()
                            switchMatrix[4].isOn = false
                            switchMatrix[9].isOn = true
                            self.delayAction(delay) {
                                switchMatrix[9].isOn = false
                                switchMatrix[14].isOn = true
                                self.delayAction(delay) {
                                    switchMatrix[14].isOn = false
                                    switchMatrix[19].isOn = true
                                    self.delayAction(delay) {
                                        switchMatrix[19].isOn = false
                                        switchMatrix[24].isOn = true
                                        self.delayAction(delay) {
                                            self.makeImpact()
                                            switchMatrix[24].isOn = false
                                            switchMatrix[23].isOn = true
                                            self.delayAction(delay) {
                                                switchMatrix[23].isOn = false
                                                switchMatrix[22].isOn = true
                                                self.delayAction(delay) {
                                                    switchMatrix[22].isOn = false
                                                    switchMatrix[21].isOn = true
                                                    self.delayAction(delay) {
                                                        switchMatrix[21].isOn = false
                                                        switchMatrix[20].isOn = true
                                                        self.delayAction(delay) {
                                                            self.makeImpact()
                                                            switchMatrix[20].isOn = false
                                                            switchMatrix[15].isOn = true
                                                            self.delayAction(delay) {
                                                                switchMatrix[15].isOn = false
                                                                switchMatrix[10].isOn = true
                                                                self.delayAction(delay) {
                                                                    switchMatrix[10].isOn = false
                                                                    switchMatrix[5].isOn = true
                                                                    self.delayAction(delay) {
                                                                        switchMatrix[5].isOn = false
                                                                        switchMatrix[6].isOn = true
                                                                        self.delayAction(delay) {
                                                                            self.makeImpact()
                                                                            switchMatrix[6].isOn = false
                                                                            switchMatrix[7].isOn = true
                                                                            self.delayAction(delay) {
                                                                                switchMatrix[7].isOn = false
                                                                                switchMatrix[8].isOn = true
                                                                                self.delayAction(delay) {
                                                                                    switchMatrix[8].isOn = false
                                                                                    switchMatrix[13].isOn = true
                                                                                    self.delayAction(delay) {
                                                                                        switchMatrix[13].isOn = false
                                                                                        switchMatrix[18].isOn = true
                                                                                        self.delayAction(delay) {
                                                                                            self.makeImpact()
                                                                                            switchMatrix[18].isOn = false
                                                                                            switchMatrix[17].isOn = true
                                                                                            self.delayAction(delay) {
                                                                                                switchMatrix[17].isOn = false
                                                                                                switchMatrix[16].isOn = true
                                                                                                self.delayAction(delay) {
                                                                                                    switchMatrix[16].isOn = false
                                                                                                    switchMatrix[11].isOn = true
                                                                                                    self.delayAction(delay) {
                                                                                                        self.makeImpact()
                                                                                                        switchMatrix[11].isOn = false
                                                                                                        switchMatrix[12].isOn = true
                                                                                                        self.delayAction(delay) {
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
    func winAnimation3() {
        let delay: Double = 0.10
        let switchMatrix = gridSwitches
        
        let frame1 = [4,9,14]
        let frame2 = [3,8,13,14,19,24]
        let frame3 = [2,7,12,13,18,23,4,9,14]
        let frame4 = [1, 3, 6, 8, 11, 12, 13, 17, 22]
        let frame5 = [0, 2, 4, 5, 7, 9, 10, 11, 12, 14, 16, 19, 21, 24]
        let frame6 = [1, 3, 4, 6, 8, 10, 11, 13, 15, 18, 20, 23, 24]
        let frame7 = [0, 2, 3, 4, 5, 7, 9, 10, 12, 14, 17, 19, 22, 23, 24]
        let frame8 = [1, 2, 3, 6, 8, 11, 13, 16, 18, 21, 22, 23]
        let frame9 = [0, 1, 2, 4, 5, 7, 9, 10, 12, 14, 15, 17, 19, 20, 21, 22]
        let frame10 = [0, 1, 3, 6, 8, 11, 13, 16, 18, 20, 21, 24]
        let frame11 = [0, 2, 5, 7, 10, 12, 15, 17, 19, 20, 23]
        let frame12 = [1, 6, 11, 16, 18, 22, 24]
        let frame13 = [0, 4, 5, 9, 10, 12, 14, 15, 17, 19, 21, 23]
        let frame14 = [3, 8, 11, 13, 16, 18, 20, 22]
        let frame15 = [2, 4, 7, 10, 12, 15, 17, 21, 24]
        let frame16 = [1, 3, 4, 6, 9, 11, 14, 16, 19, 20, 23, 24]
        let frame17 = [0, 2, 3, 4, 5, 8, 10, 13, 15, 18, 22, 23, 24]
        let frame18 = [1, 2, 3, 7, 12, 17, 21, 22, 23]
        let frame19 = [0, 1, 2, 4, 6, 9, 11, 14, 16, 19, 20, 21, 22, 24]
        let frame20 = [0, 1, 3, 5, 8, 9, 10, 13, 15, 18, 20, 21, 23]
        let frame21 = [0, 2, 7, 8, 12, 14, 17, 20, 22]
        let frame22 = [1, 6, 7, 11, 13, 16, 19, 21]
        let frame23 = [0, 4, 5, 6, 9, 10, 12, 14, 15, 18, 19, 20, 24]
        let frame24 = [3, 5, 8, 11, 13, 17, 18, 23]
        let frame25 = [2, 4, 7, 9, 10, 12, 14, 16, 17, 22, 24]
        let frame26 = [1, 3, 6, 8, 11, 13, 15, 16, 21, 23]
        let frame27 = [0, 2, 4, 5, 7, 9, 10, 12, 14, 15, 20, 22, 24]
        let frame28 = [1, 3, 6, 8, 11, 13, 21, 23]
        let frame29 = [0, 2, 4, 5, 7, 9, 10, 12, 14, 20, 22, 24]
        let frame30 = [1, 3, 6, 8, 11, 13, 21, 23]
        let frame31 = [0, 2, 5, 7, 10, 12, 20, 22]
        let frame32 = [1, 6, 11, 21]
        let frame33 = [0, 5, 10, 20]
        
        let allFrames = [frame1,frame2,frame3,frame4,frame5,frame6,frame7,frame8,frame9,frame10,frame11,frame12,frame13,frame14,frame15,frame16,frame17,frame18,frame19,frame20,frame21,frame22,frame23,frame24,frame25,frame26,frame27,frame28,frame29,frame30,frame31,frame31,frame32,frame33]
        for frame in allFrames {
            delayAction(delay) {
                for toggle in frame {
                    self.delayAction(delay) {
                    switchMatrix[toggle].isOn = true
                    self.delayAction(delay) {
                     switchMatrix[toggle].isOn = false
                        }
                    }
                }
            }
        }
//            for toggle in frame1 {
//                switchMatrix[toggle].isOn = true
//                delayAction(delay) {
//                    switchMatrix[toggle].isOn = false
//                    for toggle in frame2 {
//                        switchMatrix[toggle].isOn = true
//                        self.delayAction(delay) {
//                            switchMatrix[toggle].isOn = false
//                            for toggle in frame3 {
//                                switchMatrix[toggle].isOn = true
//                                self.delayAction(delay) {
//                                    switchMatrix[toggle].isOn = false
//                                    for toggle in frame4 {
//                                        switchMatrix[toggle].isOn = true
//                                        self.delayAction(delay) {
//                                            switchMatrix[toggle].isOn = false
//                                            for toggle in frame5 {
//                                                switchMatrix[toggle].isOn = true
//                                                self.delayAction(delay) {
//                                                    switchMatrix[toggle].isOn = false
//                                                    for toggle in frame6 {
//                                                        switchMatrix[toggle].isOn = true
//                                                        self.delayAction(delay) {
//                                                            switchMatrix[toggle].isOn = false
//                                                            for toggle in frame7 {
//                                                                switchMatrix[toggle].isOn = true
//                                                                self.delayAction(delay) {
//                                                                    switchMatrix[toggle].isOn = false
//                                                                    for toggle in frame8 {
//                                                                        switchMatrix[toggle].isOn = true
//                                                                        self.delayAction(delay) {
//                                                                            switchMatrix[toggle].isOn = false
//                                                                            for toggle in frame9 {
//                                                                                switchMatrix[toggle].isOn = true
//                                                                                self.delayAction(delay) {
//                                                                                    switchMatrix[toggle].isOn = false
//                                                                                    for toggle in frame10 {
//                                                                                        switchMatrix[toggle].isOn = true
//                                                                                        self.delayAction(delay) {
//                                                                                            switchMatrix[toggle].isOn = false
//                                                                                            for toggle in frame11 {
//                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                self.delayAction(delay) {
//                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                    for toggle in frame12 {
//                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                        self.delayAction(delay) {
//                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                            for toggle in frame13 {
//                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                self.delayAction(delay) {
//                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                    for toggle in frame14 {
//                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                        self.delayAction(delay) {
//                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                            for toggle in frame15 {
//                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                self.delayAction(delay) {
//                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                    for toggle in frame16 {
//                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                            for toggle in frame17 {
//                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                    for toggle in frame18 {
//                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                            for toggle in frame19 {
//                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                    for toggle in frame20 {
//                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                            for toggle in frame21 {
//                                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                                    for toggle in frame22 {
//                                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                                            for toggle in frame23 {
//                                                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                    for toggle in frame24 {
//                                                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                            for toggle in frame25 {
//                                                                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                    for toggle in frame26 {
//                                                                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                            for toggle in frame27 {
//                                                                                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                    for toggle in frame28 {
//                                                                                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                            for toggle in frame29 {
//                                                                                                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                                    for toggle in frame29 {
//                                                                                                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                                            for toggle in frame30 {
//                                                                                                                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                                                    for toggle in frame31 {
//                                                                                                                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                                                            for toggle in frame32 {
//                                                                                                                                                                                                                                                                                switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                                                                self.delayAction(delay) {
//                                                                                                                                                                                                                                                                                    switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                                                                    for toggle in frame33 {
//                                                                                                                                                                                                                                                                                        switchMatrix[toggle].isOn = true
//                                                                                                                                                                                                                                                                                        self.delayAction(delay) {
//                                                                                                                                                                                                                                                                                            switchMatrix[toggle].isOn = false
//                                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                                }
//                                                                                                                                                                                                                            }
//                                                                                                                                                                                                                        }
//                                                                                                                                                                                                                    }
//                                                                                                                                                                                                                }
//                                                                                                                                                                                                            }
//                                                                                                                                                                                                        }
//                                                                                                                                                                                                    }
//                                                                                                                                                                                                }
//                                                                                                                                                                                            }
//                                                                                                                                                                                        }
//                                                                                                                                                                                    }
//                                                                                                                                                                                }
//                                                                                                                                                                            }
//                                                                                                                                                                        }
//                                                                                                                                                                    }
//                                                                                                                                                                }
//                                                                                                                                                            }
//                                                                                                                                                        }
//                                                                                                                                                    }
//                                                                                                                                                }
//                                                                                                                                            }
//                                                                                                                                        }
//                                                                                                                                    }
//                                                                                                                                }
//                                                                                                                            }
//                                                                                                                        }
//                                                                                                                    }
//                                                                                                                }
//                                                                                                            }
//                                                                                                        }
//                                                                                                    }
//                                                                                                }
//                                                                                            }
//                                                                                        }
//                                                                                    }
//                                                                                }
//                                                                            }
//                                                                        }
//                                                                    }
//                                                                }
//                                                            }
//                                                        }
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
}


