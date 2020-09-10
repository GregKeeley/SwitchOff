//
//  PersistenceHelper.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 5/19/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation
import DataPersistence

enum DataPersistenceError: Error {
    case savingError(Error)
    case fileDoesNotExist(String)
    case noData
    case decodeError(Error)
    case deletingError(Error)
}

class PersistenceHelper {

    private static var userScores: Dictionary = [Int: Int]()
    private static let filename = "userScores.plist"
    
    private static func save() throws {

    }

    static func save(score: Int) throws {

    }

    static func loadScores() throws -> [Int: Int] {
        return [0:0]
    }
    // TODO: Update

    static func delete(score atIndex: Int) throws {
        
    }
}



