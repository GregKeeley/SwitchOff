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
    func resetAnimation2() {
        impact.prepare()
        let row1 = [0,5,10,15,20]
        let row2 = [1,6,11,16,21]
        let row3 = [2,7,12,17,22]
        let row4 = [3,8,13,18,23]
        let row5 = [4,9,14,19,24]
        for toggle in row1 {
            gridSwitches[toggle].isOn = true
            delayAction(0.10) {
                self.gridSwitches[toggle].isOn = false
                for toggle in row2 {
                    self.gridSwitches[toggle].isOn = true
                    self.delayAction(0.10) {
                        self.gridSwitches[toggle].isOn = false
                        for toggle in row3 {
                            self.gridSwitches[toggle].isOn = true
                            self.delayAction(0.10) {
                                self.gridSwitches[toggle].isOn = false
                                for toggle in row4 {
                                    self.gridSwitches[toggle].isOn = true
                                    self.delayAction(0.10) {
                                        self.gridSwitches[toggle].isOn = false
                                        for toggle in row5 {
                                            self.gridSwitches[toggle].isOn = true
                                            self.delayAction(0.10) {
                                                self.gridSwitches[toggle].isOn = false
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
}


