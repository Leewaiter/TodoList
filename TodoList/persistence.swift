//
//  persistence.swift
//  TodoList
//
//  Created by Lee on 2022/4/13.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
}
