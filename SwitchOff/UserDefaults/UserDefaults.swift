//
//  UserDefaults.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 1/20/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation

enum SFXStatus: String {
    case on = "On"
    case off = "Off"
}

enum AnimationTestStatus: String {
    case on = "On"
    case off = "Off"
}

struct UserPreferenceKey {
    static let SFXStatus = "SFX Status"
    static let AniTestStatus = "Animation Test Status"
}

class UserPreference {
    private init() {}
    private let standard = UserDefaults.standard
    static let shared = UserPreference()
    
    func updateSFXStatus(with status: SFXStatus) {
        standard.set(status.rawValue, forKey: UserPreferenceKey.SFXStatus)
    }
    func getSFXStatus() -> SFXStatus? {
        guard let status = standard.object(forKey: UserPreferenceKey.SFXStatus) as? String else {
            return nil
        }
        return SFXStatus(rawValue: status)
    }
    func updateAnimationTest(with status: AnimationTestStatus) {
         standard.set(status.rawValue, forKey: UserPreferenceKey.AniTestStatus)
     }
     func getAniTestStatus() -> AnimationTestStatus? {
         guard let status = standard.object(forKey: UserPreferenceKey.AniTestStatus) as? String else {
             return nil
         }
         return AnimationTestStatus(rawValue: status)
     }
     
}
