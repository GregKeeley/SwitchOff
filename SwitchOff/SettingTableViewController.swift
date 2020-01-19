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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winAnimationTestToggle.isOn = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let altVC = segue.destination as? AlternateViewController else {
            fatalError("Failed to prepare for segue")
        }
        if winAnimationTestToggle.isOn == true {
            altVC.winAnimationTest.isEnabled = true
        } else {
            altVC.winAnimationTest.isEnabled = false
        }
    }

    

}
