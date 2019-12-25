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
    @IBOutlet weak var beginGameButton: UIButton!
    @IBOutlet weak var flipsCounterLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    @IBOutlet weak var currentLevelLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    var switcher = SwitchOffBrain()
    var currentLevel = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevelLabel.isHidden = true
        levelLabel.isHidden = true
        populateSwitchArray()
        allSwitchesOff()
        nextLevelButton.isHidden = true
        winLabel.isHidden = true
        loadData()
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
    func loadData() {
            levelLabel.isHidden = false
            currentLevelLabel.isHidden = false
            currentLevelLabel.text = switcher.currentLevel.description
            beginGameButton.isHidden = true
            switcher.flipCount = 0
            flipsCounterLabel.text = switcher.flipCount.description
            populateSwitchArray()
            print("currentLevel: \(currentLevel)")
            print(switcher.currentLevel)
            switch currentLevel {
            case 1:
                switcher.level1()
            case 2:
                switcher.level2()
            case 3:
                switcher.level3()
            case 4:
                switcher.level4()
            case 5:
                switcher.level5()
            case 6:
                switcher.level6()
            case 7:
                switcher.level7()
            case 8:
                switcher.level8()
            case 9:
                switcher.level9()
            case 10:
                switcher.level10()
            default:
                break
            }
        
    }
    @IBAction func winAnimationTest() {
        populateSwitchArray()
        switcher.winAnimation()
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        nextLevelButtonPressed()
        let vc = LevelSelectViewController()
        currentLevel = vc.levelSelection
        loadData()
        print("Unwind: \(vc.levelSelection)")
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.nextLevelButton.isHidden = false
            }
            currentLevel += 1
            switcher.currentLevel += 1
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        beginGameButton.isHidden = false
        flipsCounterLabel.text = switcher.flipCount.description
        switcher.flipCount = 0
        switcher.resetAnimation()
    }
    
    

    @IBAction func
        nextLevelButtonPressed() {
        loadData()
    }
}

