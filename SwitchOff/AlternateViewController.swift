//
//  AlternateViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class AlternateViewController: UIViewController {
    
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet var switchGrid: [UISwitch]!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var winAnimationButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var level1: UIButton!
    
    var switcher = SwitchOffBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    allSwitchesOff()
        winLabel.isHidden = true
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
        switcher.neighborRight = sender.tag + 1
        switcher.neighborLeft = sender.tag - 1
        switcher.neighborDown = sender.tag + 5
        switcher.neighborUp = sender.tag - 5
        switcher.switchFlipped(senderTag: sender.tag)
//        var toggles = [toggleLeft, toggleRight, toggleUp, toggleDown]
//            if sender.tag % 5 == 0 {
//                toggles.remove(at: 1)
//            }
//            else if sender.tag % 5 == 1 {
//                toggles.remove(at: 0)
//            }
//            for toggle in toggles { //3
//                if switchRange.contains(toggle) {
//                    switcher.flipToggle(switchGrid[toggle - 1])
//                }
//                let winState = switcher.checkAllSwitches()
//                if winState == false {
//                    winLabel.isHidden = false
//                }
//            }
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
    
    @IBAction func level1ButtonPressed(_ sender: UIButton) {
        populateSwitchArray()
        allSwitchesOff()
        switcher.gridSwitches[7].isOn = true
        switcher.gridSwitches[11].isOn = true
        switcher.gridSwitches[12].isOn = true
        switcher.gridSwitches[13].isOn = true
        switcher.gridSwitches[17].isOn = true
    }
    @IBAction func level2buttonPressed(_ sender: UIButton) {
        level2()
    }
}

