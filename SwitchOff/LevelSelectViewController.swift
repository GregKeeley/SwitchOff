//
//  LevelSelectViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/29/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class LevelSelectViewController: UIViewController {
    
   let switcher = SwitchOffBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    

    
        @IBAction func levelSelectedButtonPressed(_ sender: UIButton) {
            
            switch sender.tag {
            case 1:
                print(sender.tag)
                switcher.currentLevel = sender.tag
            case 2:
                print(sender.tag)
                switcher.currentLevel = sender.tag
            case 3:
                print(sender.tag)
                switcher.currentLevel = sender.tag
            case 4:
                print(sender.tag)
                switcher.currentLevel = sender.tag
            case 5:
                switcher.currentLevel = sender.tag
            case 6:
                switcher.currentLevel = sender.tag
            case 7:
                switcher.currentLevel = 7
            case 8:
                switcher.currentLevel = 8
            case 9:
                switcher.currentLevel = 9
            case 10:
                switcher.currentLevel = 10
            default:
                break
            }
        }
    }
