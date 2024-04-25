//
//  ContentView.swift
//  TodoLIst.ver2
//
//  Created by Yachae on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks = Task.tasks
    @State private var showAddTaskView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks.sorted(by: { (task1, task2) -> Bool in
                    if task1.priority.rawValue == task2.priority.rawValue {
                        return task2.description.lowercased() < task1.description.lowercased()
                    }
                    return task2.priority.rawValue > task1.priority.rawValue
                    })) { task in
                    HStack {
                        // 원을 눌렀을 때 완료 상태 전환
                        Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.completed ? .green : .gray)
                            .onTapGesture {
                                toggleTaskCompletion(for: task)
                            }
                        Text(task.description)
                            .strikethrough(task.completed)
                        
                        Spacer()
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(self.color(for: task.priority))
                    }
                }
                .onDelete(perform: deleteTask)
            }
            // edit, + 버튼
            .navigationBarTitle("ToDo List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddTaskView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                    AddTaskView(tasks: $tasks)
                }
        }
    }
    
    func color(for priority: Priority) -> Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .yellow
        case .low:
            return .green
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    private func toggleTaskCompletion(for task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].completed.toggle()
        }
    }
}




#Preview {
    ContentView()
}
