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
    
    var currentAniTestStatus = AnimationTestStatus.off {
        didSet {
            //            print(currentAniTestStatus.rawValue)
            
            if currentAniTestStatus.rawValue == "On" {
                winAnimationTestButton.isHidden = false
            } else /*if currentAniTestStatus.rawValue == "Off"*/ {
                winAnimationTestButton.isHidden = true
            }
            currentAniTestStatus = UserPreference.shared.getAniTestStatus() ?? AnimationTestStatus.off
        }
    }
    
    var currentSFXStatus = SFXStatus.on {
        didSet {
            if currentSFXStatus.rawValue == "Off" {
                muteIcon.isHidden = false
            } else {
                muteIcon.isHidden = true
            }
            currentSFXStatus = UserPreference.shared.getSFXStatus() ?? SFXStatus.on
            loadPreferenceSettings()
        }
    }
    
    var resetSFX: AVAudioPlayer?
    
    var switchBrain = SwitchOffBrain()
    var currentLevel = 0
    var secretButtonPresses = 0
    
    var isEditingLevel = false
    var gridDisabled = false
    
    override func viewDidAppear(_ animated: Bool) {
        loadPreferenceSettings()
        updateUserPreferences()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateSwitchArray()
        switchBrain.startGameState()
        allSwitchesOff()
        loadData()
        updateUserPreferences()
        
        switchGrid[0].isOn = false
        
        
        printLevelButton.isHidden = true
        //        settingButton.isHidden = false // Do I need this line?
        winAnimationTestButton.isHidden = true
        currentLevelLabel.isHidden = true
        secretLevelButton.isHidden = true
        nextLevelButton.isHidden = true
        winLabel.isHidden = true
        resetButton.isHidden = true
        scoreNumLabel.isHidden = true
        scoreStrLabel.isHidden = true
        levelSelectButton.isHidden = true
        
        levelSelectButton.setTitleColor(UIColor(named: "systemGreen"), for: .normal)
        nextLevelButton.layer.cornerRadius = 4
        resetButton.layer.cornerRadius = 4
        settingButton.layer.cornerRadius = 4
        levelSelectButton.layer.cornerRadius = 4
        muteIcon.layer.cornerRadius = 4
        //        switchGrid[12].isOn = true
        //        switchGrid[12].isUserInteractionEnabled = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        //TODO: Provide defaults for user preferences for first load on device
        currentAniTestStatus = UserPreference.shared.getAniTestStatus() ?? AnimationTestStatus.off
        currentSFXStatus = UserPreference.shared.getSFXStatus() ?? SFXStatus.off
        updateUserPreferences()
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    private func updateUserPreferences() {
        if let aniTestStatus = UserPreference.shared.getAniTestStatus() {
            currentAniTestStatus = aniTestStatus
        }
        if let sfxTestStatus = UserPreference.shared.getSFXStatus() {
            currentSFXStatus = sfxTestStatus
        }
    }
    
    func loadPreferenceSettings() {
        if currentSFXStatus.rawValue == "Off" {
            muteIcon.isHidden = false
        } else {
            muteIcon.isHidden = true
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
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let levelSelectVC = segue.source as? LevelSelectViewController else {
            fatalError("Failed to load level")
        }
        isEditingLevel = levelSelectVC.isEditingLevel
        currentLevel = levelSelectVC.levelSelection
        loadPreferenceSettings()
        reset()
        if isEditingLevel == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.loadData()
            }
        } else {
            printLevelButton.isHidden = false
        }
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
                        self.switchBrain.nextLevelAnimation(self.nextLevelButton)
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
    @IBAction func secretButtonPressed() {
        
        secretButtonPresses += 1
        if secretButtonPresses > 5 {
            levelSelectButton.isHidden = false
        }
    }
    
    @IBAction func winAnimationTestPressed(_ sender: Any) {
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

