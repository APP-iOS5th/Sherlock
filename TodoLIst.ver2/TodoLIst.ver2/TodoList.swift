//
//  TodoList.swift
//  TodoLIst.ver2
//
//  Created by Yachae on 4/25/24.
//

import Foundation

enum Priority: String, CaseIterable, Equatable {
    case high
    case medium
    case low
}

struct Task: Identifiable {
    var id = UUID()
    var completed: Bool
    var description: String
    var priority: Priority
}

extension Task {
    static var tasks = [
        Task(completed: false, description: "Wake up", priority: .low ),
        Task(completed: false, description: "Shower", priority: .medium),
        Task(completed: false, description: "Code", priority: .high),
        Task(completed: false, description: "Eat", priority: .high ),
        Task(completed: false, description: "Sleep", priority: .high),
        Task(completed: false, description: "Get groceries", priority: .high)
    ]
    static var task = tasks[0]
}
