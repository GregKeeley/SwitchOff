//
//  AlternateViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class AlternateViewController: UIViewController {
    
    @IBOutlet var switchGrid: [UISwitch]!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var winAnimationButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var switcher = SwitchOffBrain()
    var switchRange = 1...25
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    allSwitchesOff()
    }
    
    func allSwitchesOff() {
        for state in switchGrid {
            if state.isOn == true {
                state.isOn = false
            }
        }
    }
    func populateSwitchArray() {
        for toggle in switchGrid {
            switcher.gridSwitches.append(toggle)
            startButton.isEnabled = false
        }
    }
    @IBAction func winAnimationTest() {
        populateSwitchArray()
        switcher.winAnimation()
    }
    

    
    @IBAction func switchFlipped(_ sender: UISwitch) {
        let toggleRight = sender.tag + 1
        let toggleLeft = sender.tag - 1
        let toggleDown = sender.tag + 5
        let toggleUp = sender.tag - 5
        var toggles = [toggleLeft, toggleRight, toggleUp, toggleDown]
        if sender.tag % 5 == 0 {
            toggles.remove(at: 1)
        }
        if sender.tag % 5 == 1 {
            toggles.remove(at: 0)
        }
        for toggle in toggles {
            if switchRange.contains(toggle) {
            switcher.flipToggle(switchGrid[toggle - 1])
            }
        }
//        if sender.isOn == true {
//            print("Sender: \(sender.tag) toggles: \(toggles)")
//            for toggle in toggles {
//                if switchRange.contains(toggle) {
//                    switchGrid[toggle - 1].isOn = false
//                    switcher.checkAllSwitches()
//                } else {
//                    print("\(toggle) is out of range")
//                }
//            }
//        } else {
//            print("Sender: \(sender.tag) toggles: \(toggles)")
//
//            for toggle in toggles {
//                if switchRange.contains(toggle) {
//                    switchGrid[toggle - 1].isOn = true
//
//                    switcher.checkAllSwitches()
//                } else {
//                    print("\(toggle) is out of range")
//                }
//            }
//        }
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        allSwitchesOff()
        startButton.isEnabled = true
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        populateSwitchArray()
        allSwitchesOff()
        switcher.gridSwitches[10].isOn = true
        switcher.gridSwitches[12].isOn = true
        switcher.gridSwitches[14].isOn = true
    }
}

