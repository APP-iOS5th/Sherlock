//
//  ContentView.swift
//  TodoList
//
//  Created by JIHYE SEOK on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tasks = Task.tasks
    @State var isAddType = false
    @State var taskTitle = ""
    @State var priorityType: Priority = .low
    
    @State var searchKeyword: String = ""
    
    // MARK: searching Task
    var results: [Task] {
        return searchKeyword.isEmpty ? tasks : tasks.filter({ task in
            task.tasktitle.lowercased().contains(searchKeyword.lowercased())
        })
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Image(systemName: task.completed ? "checkmark.circle" : "circle")
                            .onTapGesture {
                                if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                    tasks[index].completed.toggle()
                                }
                            }
                        Text("\(task.tasktitle)")
                        Spacer()
                        switch (task.priority) {
                        case .high:
                            Image(systemName: "circle.fill")
                                .foregroundStyle(.red)
                        case .medium:
                            Image(systemName: "circle.fill")
                                .foregroundStyle(.green)
                        default:
                            Image(systemName: "circle.fill")
                                .foregroundStyle(.yellow)
                        }
                        
//                        Picker("Priority", selection: $priorityType) {
//                            Text("High").tag(Priority.high)
//                            Text("Medium").tag(Priority.medium)
//                            Text("Low").tag(Priority.low)
//                        }
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    removeTask(target: indexSet)
                })
            }
            .navigationTitle("Todo List📝")
            .searchable(text: $searchKeyword)
            .toolbar {
                ToolbarItem {
                    
                }
            }
            
        }
    }
    func addTask() {
        let newTask = Task(completed: false, tasktitle: taskTitle, priority: priorityType)
        
        tasks.append(newTask)
    }
    
    //    func toggleCompletion(for task: Task) {
    //        task.completed.toggle()
    //    }
    
    func removeTask(target: IndexSet) {
        tasks.remove(atOffsets: target)
    }
}

#Preview {
    ContentView()
}
