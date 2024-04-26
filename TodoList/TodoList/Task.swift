//
//  Task.swift
//  TodoList
//
//  Created by JIHYE SEOK on 4/25/24.
//

import Foundation

enum Priority: Comparable, Codable {
    case high
    case medium
    case low
}


struct Task: Identifiable {
    var id = UUID()
    var completed: Bool
    var tasktitle: String
    var priority: Priority
}

extension Task {
    static var tasks = [
        Task(completed: false, tasktitle: "Wake up", priority: .low ),
        Task(completed: true, tasktitle: "Shower", priority: .medium),
        Task(completed: false, tasktitle: "Code", priority: .high),
        Task(completed: false, tasktitle: "Eat", priority: .high ),
        Task(completed: false, tasktitle: "Sleep", priority: .high),
        Task(completed: false, tasktitle: "Get groceries", priority: .high)
    ]
    static var task = tasks[0]
}
