//
//  SettingTableViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 1/19/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    @IBOutlet weak var winAnimationTestToggle: UISwitch!
    @IBOutlet weak var sfxStatusToggle: UISwitch!
    @IBOutlet weak var aniTestLabel: UILabel!
    @IBOutlet weak var sfxStatusLabel: UILabel!
    
    
    var currentSFXStatus = SFXStatus.on {

        didSet {
            updateSwitch(status: currentSFXStatus.rawValue, toggle: sfxStatusToggle)
            sfxStatusLabel.text = ("Sound Effects: \(currentSFXStatus.rawValue)")
            UserPreference.shared.updateSFXStatus(with: currentSFXStatus)
        }
    }
    var currentAniTestStatus = AnimationTestStatus.off {
        didSet {
            updateSwitch(status: currentAniTestStatus.rawValue, toggle: winAnimationTestToggle)
            aniTestLabel.text = ("Win Animation Test Button: \(currentAniTestStatus.rawValue)")
            UserPreference.shared.updateAnimationTest(with: currentAniTestStatus)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSettings()

    }
    override func viewWillDisappear(_ animated: Bool) {
        UserPreference.shared.updateSFXStatus(with: currentSFXStatus)
        UserPreference.shared.updateAnimationTest(with: currentAniTestStatus)
    }
    private func updateSwitch(status: String, toggle: UISwitch) {
        switch status {
        case "On":
            toggle.isOn = true
        case "Off":
            toggle.isOn = false
        default:
            print("error with setting status")
        }
    }
    private func updateSettings() {
        if let sfxStatus = UserPreference.shared.getSFXStatus() {
            currentSFXStatus = sfxStatus
        }
        if let aniTestStatus = UserPreference.shared.getAniTestStatus() {
            currentAniTestStatus = aniTestStatus
        }
    }
    private func toggleSFXStatus() {
        currentSFXStatus = currentSFXStatus == SFXStatus.on ? SFXStatus.off : SFXStatus.on
        UserPreference.shared.updateSFXStatus(with: currentSFXStatus)
//        guard let mainVC = AlternateViewController() as? AlternateViewController else {
//            return
//        }
//        mainVC.currentSFXStatus = currentSFXStatus
    }
    private func toggleAniTestButtonStatus() {
        currentAniTestStatus = currentAniTestStatus == AnimationTestStatus.on ? AnimationTestStatus.off : AnimationTestStatus.on
        UserPreference.shared.updateAnimationTest(with: currentAniTestStatus)
//        guard let mainVC = UIViewController() as? AlternateViewController else {
//                   return
//               }
//               mainVC.currentAniTestStatus = currentAniTestStatus
    }
    
    @IBAction func aniTestStatusChanged(_ sender: UISwitch) {
        toggleAniTestButtonStatus()
    }
    @IBAction func SFXStatusChanged(_ sender: UISwitch) {
        toggleSFXStatus()
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let altVC = segue.destination as? AlternateViewController else {
//            fatalError("Failed to prepare for segue")
//        }
//        if winAnimationTestToggle.isOn == true {
//            altVC.winAnimationTestButton.isEnabled = true
//        } else {
//            altVC.winAnimationTestButton.isEnabled = false
//        }
//    }

}
