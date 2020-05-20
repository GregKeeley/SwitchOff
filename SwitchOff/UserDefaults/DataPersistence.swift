//
//  DataPersistence.swift
//  SwitchOff
//
//  Created by Gregory Keeley on 5/19/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error {
    case savingError(Error) // Associated value
    case fileDoesNotExist(String) // here we use string as the associated value, to capture the error as a string
    case noData
    case decodeError(Error)
    case deletingError(Error)
}

class PersistenceHelper {
    private static let filename = "schedules.plist"
    
    // This private func will actually commit the saving
    private static func save() throws {
        let url = FileManager.pathToDocumentsDirectory(with: filename)

        do {
            let data = try PropertyListEncoder().encode(events)
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    // CRUD!
    // Create item
    static func save(event: Event) throws {
        events.append(event)
        do {
        try save()
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    // Read item
    static func loadEvents() throws -> [Event] {
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        // check if file exists
        if FileManager.default.fileExists(atPath: url.path) {
            if let data = FileManager.default.contents(atPath: url.path) {
                do {
                    events = try PropertyListDecoder().decode([Event].self, from: data)
                } catch {
                    throw DataPersistenceError.decodeError(error)
                }
            } else {
                throw DataPersistenceError.noData
            }
        } else {
            throw DataPersistenceError.fileDoesNotExist(filename)
        }
        return events
    }
    
    
    // Update item
   
    // Delete item
    static func delete(event atIndex: Int) throws {
        events.remove(at: atIndex)
        // save events to our documents directory
        do {
            try save()
        } catch {
            throw DataPersistenceError.deletingError(error)
        }
    }
}
