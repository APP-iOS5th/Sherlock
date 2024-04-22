//
//  ContentView.swift
//  SimpleMemo
//
//  Created by MadCow on 2024/4/22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo, .gray, .orange, .green, .brown, .mint, .pink]
    
    @Query(sort: \Memo.date) var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    
    @State var createMemoIsShowing: Bool = false
    @State var editMemoIsShowing: Bool = false
    @State var selectedMemo: Memo?
    @State var memoColor: Color = .blue

    var body: some View {
        NavigationStack {
            List(memos) { memo in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(memo.title)
                                .font(.title)
                            Text(memo.date)
                                .font(.body)
                                .padding(.top)
                        }
                        Spacer()
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color(UIColor(red: memo.color.red,
                                              green: memo.color.green,
                                              blue: memo.color.blue,
                                              alpha: memo.color.alpha)))
                    .shadow(radius: 3)
                    .padding()
                    .contextMenu {
                        Button {
                            modelContext.delete(memo)
                        } label: {
                            Image(systemName: "trash.slash")
                            Text("삭제")
                        }
                    }
                    .onTapGesture {
                        selectedMemo = memo
                        editMemoIsShowing = true
                    }
            }
            .sheet(isPresented: $createMemoIsShowing, content: {
                MemoAddView(isSheetShowing: $createMemoIsShowing, memoColor: $memoColor, colors: colors)
                    .modelContainer(for: Memo.self)
            })
            .sheet(isPresented: $editMemoIsShowing, content: {
                MemoEditView(selectedMemo: $selectedMemo, memoEditAppear: $editMemoIsShowing)
            })
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        createMemoIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
