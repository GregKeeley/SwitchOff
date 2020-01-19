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
    var isEditingLevel = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        @IBAction func levelSelectedButtonPressed(_ sender: UIButton) {
            levelSelection = sender.tag
    }
    @IBAction func levelEditorButtonPressed() {
        isEditingLevel = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let alternateVC = segue.destination as? AlternateViewController else {
            fatalError("Failed to prepare for segue")
        }
        let level = levelSelection
        alternateVC.currentLevel = level
    }
    
}

