//
//  TodoModel.swift
//  TodoList
//
//  Created by MadCow on 2024/4/25.
//

import SwiftUI
import SwiftData

@Model
class TodoModel {
    let id: UUID = UUID()
    var completed: Bool
    var todoDescription: String
    var priority: Priority
    
    init(completed: Bool, todoDescription: String, priority: Priority) {
        self.completed = completed
        self.todoDescription = todoDescription
        self.priority = priority
    }
}

enum Priority: String, Codable{
    case high = "높음"
    case medium = "중간"
    case low = "낮음"
}
