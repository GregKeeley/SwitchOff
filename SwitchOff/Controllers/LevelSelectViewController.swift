//
//  LevelSelectViewController.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 11/29/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class LevelSelectViewController: UIViewController {
    
    @IBOutlet weak var levelPicker: UIPickerView!
    
    var levelSelection = 1
    var isEditingLevel = false
    var levels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelPicker.dataSource = self
        levelPicker.delegate = self
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        levelSelection = levels[row]
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
extension LevelSelectViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        levels.count
    }
}
extension LevelSelectViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ("Level: \(levels[row])")
    }
}
