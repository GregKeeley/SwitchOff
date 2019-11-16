//
//  ViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/16/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var switch_1: UISwitch!
    @IBOutlet weak var switch_2: UISwitch!
    @IBOutlet weak var switch_3: UISwitch!
    
    @IBOutlet weak var winLoseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func switchCheck() {
        if switch_1.isOn == false && switch_2.isOn == false && switch_3.isOn == false {
            winLoseLabel.text = "WIN!"
        } else {
            winLoseLabel.text = "Lose!"
        }
    }
    @IBAction func switch_1Toggled(_ sender: UISwitch) {
        switch_2.isOn = true
        switch_3.isOn = false
    }
    @IBAction func switch_2Toggled(_ sender: UISwitch) {
        switch_1.isOn = false
        switch_3.isOn = true
    }
    @IBAction func switch_3Toggled(_ sender: UISwitch) {
        if switch_2.isOn == true {
            switch_2.isOn = false
        }
        switch_2.isOn = true
        switch_1.isOn = false
    }
    

}

