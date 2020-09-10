//
//  AlternateViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit
import AVFoundation

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
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var printLevelButton: UIButton!
    
    @IBOutlet weak var muteIcon: UIImageView!
    @IBOutlet weak var winAnimationTestButton: UIButton!
    
    var gridDisabled = false
    
    var currentAniTestStatus = AnimationTestStatus.off {
        didSet {
            confifgureTestAnimationButton()
        }
    }
    var currentSFXStatus = SFXStatus.on {
        didSet {
            
            configureMuteIcon()
        }
    }
    
    
    var resetSFX: AVAudioPlayer?
    
    var switchBrain = SwitchOffBrain()
    var currentLevel = 0
    var secretButtonPresses = 0
    var isEditingLevel = false
    var currentLevelRecordScore = 0
    
    override func viewDidAppear(_ animated: Bool) {
        //        configureMuteIcon()
        loadUserDefaults()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateSwitchArray()
        switchBrain.startGameState()
        allSwitchesOff()
        loadData()
        loadUserDefaults()
        
        switchGrid[0].isOn = false
        
        printLevelButton.isHidden = true
        settingButton.isHidden = false
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
        resetButton.layer.cornerRadius = 4
        settingButton.layer.cornerRadius = 4
        levelSelectButton.layer.cornerRadius = 4
        muteIcon.layer.cornerRadius = 4
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        currentAniTestStatus = UserPreference.shared.getAniTestStatus() ?? AnimationTestStatus.off
        currentSFXStatus = UserPreference.shared.getSFXStatus() ?? SFXStatus.on
        loadUserDefaults()
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    private func getPlayerScore() {
        // TODO: Create a player score to be saved and loaded from userDefaults
    }
    
    private func loadUserDefaults() {
        if let aniTestStatus = UserPreference.shared.getAniTestStatus() {
            currentAniTestStatus = aniTestStatus
        }
        if let sfxTestStatus = UserPreference.shared.getSFXStatus() {
            currentSFXStatus = sfxTestStatus
        }
    }
    func configureMuteIcon() {
        if currentSFXStatus.rawValue == "Off" {
            muteIcon.isHidden = false
        } else {
            muteIcon.isHidden = true
        }
    }
    func confifgureTestAnimationButton() {
        if switchBrain.gameStarted {
            if currentAniTestStatus.rawValue == "On" {
                winAnimationTestButton.isHidden = false
            } else {
                winAnimationTestButton.isHidden = true
            }
        } else {
            winAnimationTestButton.isHidden = true
        }
    }
    func playSound(fileName: String, format: String) {
        if currentSFXStatus.rawValue == "On" {
            let path = Bundle.main.path(forResource: fileName, ofType: format)!
            let url = URL(fileURLWithPath: path)
            
            do {
                resetSFX = try AVAudioPlayer(contentsOf: url)
                resetSFX?.play()
                print("played resetSound")
            } catch {
                print("could not load resetSound")
            }
        } else {
            print("Sound is muted")
        }
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
        playSound(fileName: "resetSound2", format: "mp3")
        scoreNumLabel.text = switchBrain.flipCount.description
        switchBrain.flipCount = 0
        switchBrain.resetAnimation2(level: switchBrain.loadLevelArray(currentLevel: currentLevel))
    }
    func loadData() {
        winLabel.isHidden = true
        secretLevelButton.isHidden = false
        currentLevelLabel.isHidden = false
        currentLevelLabel.text = currentLevel.description
        switchBrain.flipCount = 0
        scoreNumLabel.text = switchBrain.flipCount.description
        populateSwitchArray()
        switchBrain.loadLevelSwitches(toggles: switchBrain.loadLevelArray(currentLevel: currentLevel))
    }
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        let settingsVC = UIStoryboard(name: "SettingsViewController", bundle: nil).instantiateViewController(identifier: "SettingsViewController")
        if let navigator = navigationController {
            navigator.pushViewController(settingsVC, animated: true)
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let levelSelectVC = segue.source as? LevelSelectViewController else {
            fatalError("Failed to load level")
        }
        isEditingLevel = levelSelectVC.isEditingLevel
        currentLevel = levelSelectVC.levelSelection
        reset()
        if isEditingLevel == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.loadData()
            }
        } else {
            printLevelButton.isHidden = false
        }
        
    }
    @IBAction func unwindSettingsSegue(segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingTableViewController else {
            fatalError("failed to load from settings")
        }
        currentAniTestStatus = settingsVC.currentAniTestStatus
        currentSFXStatus = settingsVC.currentSFXStatus
    }
    @IBAction func switchFlipped(_ sender: UISwitch) {
        switchBrain.gameHasBegun()
        if isEditingLevel == false {
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
            if currentLevel > 0 {
                if winState == true {
                    playSound(fileName: "winFanfare2", format: "mp3")
                    //gridDisabled = true
                    winLabel.isHidden = false
                    switchBrain.winAnimation()
                    switchBrain.changeGridStatus()
                    gridDisabled = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.nextLevelButton.isHidden = false
                    }
                    //currentLevel += 1
                    //switchBrain.currentLevel += 1
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
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        playSound(fileName: "resetSound2", format: "mp3")
        if gridDisabled == false {
            if isEditingLevel == false {
                nextLevelButton.isHidden = true
                scoreNumLabel.text = switchBrain.flipCount.description
                switchBrain.flipCount = 0
                switchBrain.resetAnimation2(level: switchBrain.loadLevelArray(currentLevel: currentLevel))
                //switchBrain.changeGridStatus()
                //            currentLevel = currentLevel - 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.loadData()
                }
            } else {
                switchBrain.resetAnimation2(level: switchBrain.loadLevelArray(currentLevel: currentLevel))
            }
        } else {
            switchBrain.resetAnimation2(level: switchBrain.loadLevelArray(currentLevel: currentLevel))
            switchBrain.changeGridStatus()
            nextLevelButton.isHidden = true
            print("Reset button pressed: gridStatus: \(gridDisabled)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.loadData()
            }
        }
        
    }
    @IBAction func nextLevelButtonPressed() {
        currentLevel += 1
        switchBrain.currentLevel += 1
        nextLevelButton.isHidden = true
        gridDisabled = false
        switchBrain.changeGridStatus()
        loadData()
    }
    @IBAction func secretLevelSelectButtonPressed() {
        secretButtonPresses += 1
        if secretButtonPresses > 5 {
            levelSelectButton.isHidden = false
        }
    }
    @IBAction func winAnimationTestPressed(_ sender: Any) {
        playSound(fileName: "winFanfare2", format: "mp3")
        switchBrain.winAnimation()
    }
    @IBAction func printLevelButtonPressed() {
        var newLevelToggles = [Int]()
        print("Ok")
        for toggle in switchGrid {
            if toggle.isOn == true {
                newLevelToggles.append(toggle.tag - 1)
            }
        }
        print(newLevelToggles)
    }
}

