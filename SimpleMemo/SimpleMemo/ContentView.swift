//
//  ContentView.swift
//  SimpleMemo
//
//  Created by MadCow on 2024/4/22.
//

import SwiftUI
import SwiftData
import UIKit

struct ContentView: View {
    
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo, .gray, .orange, .green, .brown, .mint, .pink]
    
    @Query(sort: \Memo.date) var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    
    @State var isSheetShowing: Bool = false
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
                    .background(colors.randomElement()!)
                    .shadow(radius: 3)
                    .padding()
                    .contextMenu {
                        ShareLink(item: memo.title)
                        Button {
                            modelContext.delete(memo)
                        } label: {
                            Image(systemName: "trash.slash")
                            Text("삭제")
                        }
                    }
                    .sheet(isPresented: $isSheetShowing, content: {
                        MemoAddView(selectedMemo: memo, isSheetShowing: $isSheetShowing)
                            .modelContainer(for: Memo.self)
                    })
            }
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
//                        addMemo()
                        isSheetShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .listStyle(.plain)
        }
    }
    
    func addMemo() {
        let randomColor: Color = colors.randomElement()!
        let uiColor = UIColor(randomColor)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let newMemo = Memo(title: "",
                           date: Date().currentDateString/*,
                           color: MemoColor(red: red, green: green, blue: blue, alpha: alpha)*/)
        
        modelContext.insert(newMemo)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self)
}
