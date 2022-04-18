//
//  TodoListApp.swift
//  TodoList
//
//  Created by Lee on 2022/4/13.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
