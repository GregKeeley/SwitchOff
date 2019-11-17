//
//  SwitchOffBrain.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

class SwitchOffBrain {
    
    var neighborleft = Int()
    var neighborRight = Int()
    var neighborDown = Int()
    var neighborUp = Int()
    
    var neighborSwitches = [Int]()
    
    
    func getNeighborTag(tag: Int) {
        neighborleft = tag - 1
        neighborRight = tag + 1
        neighborDown = tag + 5
        neighborUp = tag - 5
        neighborSwitches.append(neighborUp)
        neighborSwitches.append(neighborRight)
        neighborSwitches.append(neighborleft)
        neighborSwitches.append(neighborDown)
        print(neighborSwitches, neighborUp, neighborDown, neighborRight, neighborleft)
        
    }
    func clearSwitchArray() {
        neighborSwitches.removeAll()
    }
}
