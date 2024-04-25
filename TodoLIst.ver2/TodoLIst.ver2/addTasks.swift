//
//  addTasks.swift
//  TodoLIst.ver2
//
//  Created by Yachae on 4/25/24.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var tasks: [Task]
    @State private var newTaskDescription = ""
    @State private var newTaskPriority = Priority.medium
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Task Description", text: $newTaskDescription)
                    .padding()
                Text("중요도 선택")
                    .bold()
                Picker("Priority", selection: $newTaskPriority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue.capitalized)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                
                Button(action: {
                    let newTask = Task(id: UUID(), completed: false, description: newTaskDescription, priority: newTaskPriority)
                    tasks.append(newTask)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.indigo)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("New Task")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            })
        }
    }
}

//#Preview {
//    addTasks()
//}
