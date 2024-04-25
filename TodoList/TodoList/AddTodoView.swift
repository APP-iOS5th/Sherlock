//
//  AddTodoView.swift
//  TodoList
//
//  Created by MadCow on 2024/4/25.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var isShowing: Bool
    
    @State private var priority: Priority = .medium
    @State private var todoText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("우선순위", selection: $priority) {
                    Text(Priority.high.rawValue).tag(Priority.high)
                    Text(Priority.medium.rawValue).tag(Priority.medium)
                    Text(Priority.low.rawValue).tag(Priority.low)
                }
                .pickerStyle(.segmented)
                Spacer()
                HStack {
                    TextField("Todo", text: $todoText)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Button("취소") {
                         isShowing = false
                    }
                    Spacer()
                    Button("추가") {
                        modelContext.insert(TodoModel(completed: false, todoDescription: todoText, priority: priority))
                        isShowing = false
                    }
                    .disabled(todoText.isEmpty)
                    Spacer()
                }
            }
            .navigationTitle("Add Todo")
        }
        .padding()
    }
}

//#Preview {
//    AddTodoView()
//}
