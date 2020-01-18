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
    @IBOutlet weak var flipsCounterLabel: UILabel!
    @IBOutlet weak var nextLevelButton: UIButton!
    @IBOutlet weak var currentLevelLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet var titleLabels: [UILabel]!
    var switchBrain = SwitchOffBrain()
    var currentLevel = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateSwitchArray()
        switchBrain.startGameState()
        allSwitchesOff()
        currentLevelLabel.isHidden = true
        levelLabel.isHidden = true

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
            switchBrain.gridSwitches.append(toggle)
        }
    }
    func reset() {
        flipsCounterLabel.text = switchBrain.flipCount.description
        switchBrain.flipCount = 0
        switchBrain.resetAnimation()
    }
    func loadData() {
        winLabel.isHidden = true
        levelLabel.isHidden = false
        currentLevelLabel.isHidden = false
        currentLevelLabel.text = currentLevel.description
        
        switchBrain.flipCount = 0
        flipsCounterLabel.text = switchBrain.flipCount.description
        populateSwitchArray()
        switch currentLevel {
        case 1:
            switchBrain.level1()
        case 2:
            switchBrain.level2()
        case 3:
            switchBrain.level3()
        case 4:
            switchBrain.level4()
        case 5:
            switchBrain.level5()
        case 6:
            switchBrain.level6()
        case 7:
            switchBrain.level7()
        case 8:
            switchBrain.level8()
        case 9:
            switchBrain.level9()
        case 10:
            switchBrain.level10()
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
        flipsCounterLabel.text = switchBrain.flipCount.description
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
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        nextLevelButton.isHidden = true
        flipsCounterLabel.text = switchBrain.flipCount.description
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
}

