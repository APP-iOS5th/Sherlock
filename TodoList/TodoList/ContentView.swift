//
//  ContentView.swift
//  TodoList
//
//  Created by MadCow on 2024/4/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var todoLists: [TodoModel]
    
    @State private var addTodoIsShowing: Bool = false
    @State private var sort: Int = 0
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(todoLists) { todo in
                    HStack(spacing: 20) {
                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(todo.completed ? .blue : .gray)
                            
                        todo.completed ? Text(todo.todoDescription).strikethrough() : Text(todo.todoDescription)
                        
                        Spacer()
                        
                        if !todo.completed {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundStyle(todo.priority == Priority.high ? .red :
                                                    todo.priority == Priority.medium ? .orange : .green)
                        }
                    }
                    .padding()
                    .onTapGesture {
                        todo.completed.toggle()
                    }
                }
                .onDelete(perform: { indexSet in
                    guard let index = indexSet.first else { return }
                    modelContext.delete(todoLists[index])
                })
            }
            .navigationTitle("To do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker("sort", selection: $sort) {
                        HStack {
                            Text("Priority")
                            Image(systemName: "arrowtriangle.down.fill")
                                .frame(width: 5, height: 5)
                        }
                        .tag(0)
                        Text("Todo").tag(1)
                    }
                    .onChange(of: sort) { _, newValue in
//                        if newValue == 0 {
//                            todoLists = todoLists.sorted{ $0.priority.rawValue < $1.priority.rawValue }
//                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addTodoIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $addTodoIsShowing, content: {
            AddTodoView(isShowing: $addTodoIsShowing)
                .modelContainer(for: TodoModel.self)
        })
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoModel.self)
}
