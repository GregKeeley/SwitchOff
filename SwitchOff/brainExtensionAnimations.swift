//
//  brainExtensionAnimations.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 1/18/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

extension SwitchOffBrain {
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
    
    func toggleSwitches(switchArray: [Int], delay: Double) {
        for toggle in switchArray {
            impact.impactOccurred()
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.gridSwitches[toggle].isOn = true
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.gridSwitches[toggle].isOn = false
                }
            }
        }
    }
    func toggleSwitches2(switchArray: [Int], delay: Double) {
        for toggle in switchArray {
            impact.impactOccurred()
            waitTenthSec()
                self.gridSwitches[toggle].isOn = true
               waitTenthSec()
                    self.gridSwitches[toggle].isOn = false
                }
            
        
    }
    func resetAnimation3() {
        let rows = [[0,5,10,15,20],
                    [1,6,11,16,21],
                    [2,7,12,17,22],
                    [3,8,13,18,23],
                    [4,9,14,19,24]]

                
                for row in rows {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                    for _ in 1...5 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                        self.toggleSwitches(switchArray: row, delay: 0.10)
                    }
                }
            }
        }
    }
    func waitTenthSec(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
        }
    }
    func makeImpact() {
        impact.impactOccurred(intensity: CGFloat(0.99))
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                self.gridSwitches[toggle].isOn = false
                for toggle in row2 {
                    
                    self.gridSwitches[toggle].isOn = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                        self.gridSwitches[toggle].isOn = false
                        for toggle in row3 {
                            
                            self.gridSwitches[toggle].isOn = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                                self.gridSwitches[toggle].isOn = false
                                
                                for toggle in row4 {
                                    
                                    self.gridSwitches[toggle].isOn = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                                        self.gridSwitches[toggle].isOn = false
                                        
                                        for toggle in row5 {
                                            self.gridSwitches[toggle].isOn = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
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

//        switchMatrix[0].isOn = true
//        switchMatrix[5].isOn = true
//        switchMatrix[10].isOn = true
//        switchMatrix[15].isOn = true
//        switchMatrix[20].isOn = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
//            self.impact.impactOccurred()
//            switchMatrix[0].isOn = false
//            switchMatrix[5].isOn = false
//            switchMatrix[10].isOn = false
//            switchMatrix[15].isOn = false
//            switchMatrix[20].isOn = false
//            switchMatrix[1].isOn = true
//            switchMatrix[6].isOn = true
//            switchMatrix[11].isOn = true
//            switchMatrix[16].isOn = true
//            switchMatrix[21].isOn = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
//                self.impact.impactOccurred()
//                switchMatrix[1].isOn = false
//                switchMatrix[6].isOn = false
//                switchMatrix[11].isOn = false
//                switchMatrix[16].isOn = false
//                switchMatrix[21].isOn = false
//                switchMatrix[2].isOn = true
//                switchMatrix[7].isOn = true
//                switchMatrix[12].isOn = true
//                switchMatrix[17].isOn = true
//                switchMatrix[22].isOn = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
//                    self.impact.impactOccurred()
//                    switchMatrix[2].isOn = false
//                    switchMatrix[7].isOn = false
//                    switchMatrix[12].isOn = false
//                    switchMatrix[17].isOn = false
//                    switchMatrix[22].isOn = false
//                    switchMatrix[3].isOn = true
//                    switchMatrix[8].isOn = true
//                    switchMatrix[13].isOn = true
//                    switchMatrix[18].isOn = true
//                    switchMatrix[23].isOn = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
//                        self.impact.impactOccurred()
//                        switchMatrix[3].isOn = false
//                        switchMatrix[8].isOn = false
//                        switchMatrix[13].isOn = false
//                        switchMatrix[18].isOn = false
//                        switchMatrix[23].isOn = false
//                        switchMatrix[4].isOn = true
//                        switchMatrix[9].isOn = true
//                        switchMatrix[14].isOn = true
//                        switchMatrix[19].isOn = true
//                        switchMatrix[24].isOn = true
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
//                            self.impact.impactOccurred()
//                            switchMatrix[4].isOn = false
//                            switchMatrix[9].isOn = false
//                            switchMatrix[14].isOn = false
//                            switchMatrix[19].isOn = false
//                            switchMatrix[24].isOn = false
//                        }
//                    }
//                }
//            }
//        }
//    }
//
    func winAnimation2() {
        let delay = 0.05
        let winArray = [0,1,2,3,4,9,14,19,24,23,22,21,20,15,10,5,6,7,8,13,18,17,16,11,12]
        toggleSwitches2(switchArray: winArray, delay: delay)
    }
}
//    func winAnimation2() {
//        let delay = 0.05
//        let switchMatrix = gridSwitches
//        switchMatrix[0].isOn = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            switchMatrix[0].isOn = false
//            switchMatrix[1].isOn = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                switchMatrix[1].isOn = false
//                switchMatrix[2].isOn = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                    switchMatrix[2].isOn = false
//                    switchMatrix[3].isOn = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                        switchMatrix[3].isOn = false
//                        switchMatrix[4].isOn = true
//                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                            switchMatrix[4].isOn = false
//                            switchMatrix[9].isOn = true
//                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                switchMatrix[9].isOn = false
//                                switchMatrix[14].isOn = true
//                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                    switchMatrix[14].isOn = false
//                                    switchMatrix[19].isOn = true
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                        switchMatrix[19].isOn = false
//                                        switchMatrix[24].isOn = true
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                            switchMatrix[24].isOn = false
//                                            switchMatrix[23].isOn = true
//                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                switchMatrix[23].isOn = false
//                                                switchMatrix[22].isOn = true
//                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                    switchMatrix[22].isOn = false
//                                                    switchMatrix[21].isOn = true
//                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                        switchMatrix[21].isOn = false
//                                                        switchMatrix[20].isOn = true
//                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                            switchMatrix[20].isOn = false
//                                                            switchMatrix[15].isOn = true
//                                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                switchMatrix[15].isOn = false
//                                                                switchMatrix[10].isOn = true
//                                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                    switchMatrix[10].isOn = false
//                                                                    switchMatrix[5].isOn = true
//                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                        switchMatrix[5].isOn = false
//                                                                        switchMatrix[6].isOn = true
//                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                            switchMatrix[6].isOn = false
//                                                                            switchMatrix[7].isOn = true
//                                                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                switchMatrix[7].isOn = false
//                                                                                switchMatrix[8].isOn = true
//                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                    switchMatrix[8].isOn = false
//                                                                                    switchMatrix[13].isOn = true
//                                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                        switchMatrix[13].isOn = false
//                                                                                        switchMatrix[18].isOn = true
//                                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                            switchMatrix[18].isOn = false
//                                                                                            switchMatrix[17].isOn = true
//                                                                                            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                                switchMatrix[17].isOn = false
//                                                                                                switchMatrix[16].isOn = true
//                                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                                    switchMatrix[16].isOn = false
//                                                                                                    switchMatrix[11].isOn = true
//                                                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                                        switchMatrix[11].isOn = false
//                                                                                                        switchMatrix[12].isOn = true
//                                                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//                                                                                                            switchMatrix[12].isOn = false
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
//    }
//}
//
