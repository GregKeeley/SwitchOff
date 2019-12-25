//
//  LevelSelectViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/29/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class LevelSelectViewController: UIViewController {
    
    var levelSelection = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
        @IBAction func levelSelectedButtonPressed(_ sender: UIButton) {
            //switcher.currentLevel = sender.tag
            levelSelection = sender.tag
            
            print(levelSelection)
            print("sender.tag: \(sender.tag)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let alternateVC = segue.destination as? AlternateViewController else {
            fatalError("Failed to prepare for segue")
        }
        let level = levelSelection
        alternateVC.currentLevel = level
    }
    
}
