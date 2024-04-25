//
//  TodoList.swift
//  TodoLIst.ver2
//
//  Created by Yachae on 4/25/24.
//

import Foundation

enum Priority: String, CaseIterable, Equatable {
    case high = "a"
    case medium = "b"
    case low = "c"
}

struct Task: Identifiable {
    var id = UUID()
    var completed: Bool
    var description: String
    var priority: Priority
}

extension Task {
    static var tasks = [Task]()
    static var task = tasks[0]
}
