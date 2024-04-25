//
//  TodoListApp.swift
//  TodoList
//
//  Created by MadCow on 2024/4/25.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: TodoModel.self)
        }
    }
}
