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
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var scoreNumLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    @IBOutlet weak var currentLevelLabel: UILabel!
    @IBOutlet weak var secretLevelButton: UIButton!
    @IBOutlet weak var scoreStrLabel: UILabel!
    @IBOutlet weak var levelSelectButton: UIButton!
    @IBOutlet var titleLabels: [UILabel]!
    
    
    @IBOutlet weak var winAnimationTest: UIButton!
    
    var switchBrain = SwitchOffBrain()
    var currentLevel = 0
    var secretButtonPresses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateSwitchArray()
        switchBrain.startGameState()
        allSwitchesOff()
        loadData()
        
        winAnimationTest.isHidden = true
        currentLevelLabel.isHidden = true
        secretLevelButton.isHidden = true
        nextLevelButton.isHidden = true
        winLabel.isHidden = true
        resetButton.isHidden = true
        scoreNumLabel.isHidden = true
        scoreStrLabel.isHidden = true
        levelSelectButton.setTitleColor(UIColor(named: "systemGreen"), for: .normal)
        levelSelectButton.isHidden = true
    
        nextLevelButton.layer.cornerRadius = 4
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
            switchBrain.gridSwitches.append(toggle)
        }
    }
    func reset() {
        scoreNumLabel.text = switchBrain.flipCount.description
        switchBrain.flipCount = 0
        switchBrain.resetAnimation2()
    }
    func loadData() {
        winLabel.isHidden = true
        secretLevelButton.isHidden = false
        currentLevelLabel.isHidden = false
        currentLevelLabel.text = currentLevel.description
        
        switchBrain.flipCount = 0
        scoreNumLabel.text = switchBrain.flipCount.description
        populateSwitchArray()
        switch currentLevel {
        case 0:
            switchBrain.loadLevelSwitches(toggles: levels.level0)
        case 1:
            switchBrain.loadLevelSwitches(toggles: levels.level1)
        case 2:
            switchBrain.loadLevelSwitches(toggles: levels.level2)
        case 3:
            switchBrain.loadLevelSwitches(toggles: levels.level3)
        case 4:
            switchBrain.loadLevelSwitches(toggles: levels.level4)
        case 5:
            switchBrain.loadLevelSwitches(toggles: levels.level5)
        case 6:
            switchBrain.loadLevelSwitches(toggles: levels.level6)
        case 7:
            switchBrain.loadLevelSwitches(toggles: levels.level7)
        case 8:
            switchBrain.loadLevelSwitches(toggles: levels.level8)
        case 9:
            switchBrain.loadLevelSwitches(toggles: levels.level9)
        case 10:
            switchBrain.loadLevelSwitches(toggles: levels.level10)
        case 11:
            switchBrain.loadLevelSwitches(toggles: levels.level11)
        case 12:
            switchBrain.loadLevelSwitches(toggles: levels.level12)
        case 13:
            switchBrain.loadLevelSwitches(toggles: levels.level13)
        case 14:
            switchBrain.loadLevelSwitches(toggles: levels.level14)
        case 15:
            switchBrain.loadLevelSwitches(toggles: levels.level15)
        case 16:
            switchBrain.loadLevelSwitches(toggles: levels.level16)
        case 17:
            switchBrain.loadLevelSwitches(toggles: levels.level17)
        case 18:
            switchBrain.loadLevelSwitches(toggles: levels.level18)
        case 19:
            switchBrain.loadLevelSwitches(toggles: levels.level19)
        case 20:
            switchBrain.loadLevelSwitches(toggles: levels.level20)
        case 21:
            switchBrain.loadLevelSwitches(toggles: levels.level21)
        case 22:
            switchBrain.loadLevelSwitches(toggles: levels.level22)
        case 23:
            switchBrain.loadLevelSwitches(toggles: levels.level23)
        case 24:
            switchBrain.loadLevelSwitches(toggles: levels.level24)
        case 25:
            switchBrain.loadLevelSwitches(toggles: levels.level25)
        default:
            break
        }
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let levelSelectVC = segue.source as? LevelSelectViewController else {
            fatalError("Failed to load level")
        }
        currentLevel = levelSelectVC.levelSelection
        reset()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.loadData()
        }
    }
    @IBAction func switchFlipped(_ sender: UISwitch) {
        switchBrain.gameHasBegun()
        for title in titleLabels {
            title.isHidden = true
        }
        switchBrain.flipCount += 1
        scoreNumLabel.text = switchBrain.flipCount.description
        switchBrain.switchStates.removeAll()
        var neighborToggles = [(sender.tag - 1), (sender.tag + 1), (sender.tag - 5), (sender.tag + 5)]
        if sender.tag % 5 == 0 {
            neighborToggles.remove(at: 1)
        }
        if sender.tag % 5 == 1 {
            neighborToggles.remove(at: 0)
        }
        for toggle in neighborToggles {
            if switchBrain.switchRange.contains(toggle) {
                switchBrain.flipToggle(switchGrid[toggle - 1])
            }
        }
        let winState = switchBrain.winCheck()
        if currentLevel != 0 {
            if winState == true {
                winLabel.isHidden = false
                switchBrain.winAnimation()
                switchBrain.changeGridStatus()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.nextLevelButton.isHidden = false
                }
                currentLevel += 1
                switchBrain.currentLevel += 1
            }
        } else {
            scoreStrLabel.isHidden = false
            scoreNumLabel.isHidden = false
            resetButton.isHidden = false
            
            currentLevel += 1
            switchBrain.currentLevel += 1
            loadData()
        }
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        nextLevelButton.isHidden = true
        scoreNumLabel.text = switchBrain.flipCount.description
        switchBrain.flipCount = 0
        switchBrain.resetAnimation2()
       // switcher.resetAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.loadData()
        }
    }
    @IBAction func nextLevelButtonPressed() {
        nextLevelButton.isHidden = true
        switchBrain.changeGridStatus()
        loadData()
    }
    @IBAction func secretButtonPressed() {
        secretButtonPresses += 1
        if secretButtonPresses > 25 {
            levelSelectButton.isHidden = false
        }
    }
    
    @IBAction func winAnimationTestPressed(_ sender: Any) {
        switchBrain.winAnimation()
    }
}

