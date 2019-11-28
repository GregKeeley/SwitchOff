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
    @IBOutlet weak var winAnimationButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var level1: UIButton!
    @IBOutlet weak var flipsCounterLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    
    var switcher = SwitchOffBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateSwitchArray()
        allSwitchesOff()
        nextLevelButton.isHidden = true
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
        }
    }
    @IBAction func winAnimationTest() {
        populateSwitchArray()
        switcher.winAnimation()
    }
    
    
    
    @IBAction func switchFlipped(_ sender: UISwitch) {
        switcher.flipCount += 1
        flipsCounterLabel.text = switcher.flipCount.description
        switcher.switchStates.removeAll()
        print(switcher.switchStates.count)
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
            if switcher.switchRange.contains(toggle) {
                switcher.flipToggle(switchGrid[toggle - 1])
            }
        }
        let winState = switcher.winCheck()
        if winState == true {
            winLabel.isHidden = false
            switcher.winAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                self.nextLevelButton.isHidden = false
            }
            switcher.currentLevel += 1
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        switcher.flipCount = 0
        switcher.resetAnimation()
    }
    
    
    @IBAction func level1ButtonPressed(_ sender: UIButton) {
        switcher.level1()
    }
    @IBAction func nextLevelButtonPressed() {
        switcher.flipCount = 0
        switch switcher.currentLevel {
        case 1:
            switcher.level1()
        case 2:
            switcher.level2()
        case 3:
            switcher.level3()
        default:
            break
        }
    }
}

