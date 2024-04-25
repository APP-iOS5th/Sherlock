//
//  ContentView.swift
//  Memo
//
//  Created by JIHYE SEOK on 4/22/24.
//

import SwiftUI
import SwiftData

struct MemoAddView: View {
    
    @Binding var memoColor: Color
    @Binding var memoText: String
    @Binding var isSheetShowing: Bool
    @Environment(\.modelContext) var modelContext
    let colors: [Color]
    
    var body: some View {
        VStack {
            HStack {
                Button("취소") {
                    isSheetShowing = false
                }
                Spacer()
                Button("완료") {
                    
                    let memo = Memo(text: memoText, color: memoColor created: Date())
                    modelContext.insert(memo)
                    isSheetShowing = false
                }
                .disabled(memoText.isEmpty)
            }
            HStack {
                ForEach(colors, id:\.self) { color in
                    Button {
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(Color.white)
                        .background(color)
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            Divider()
                .padding()
            TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                .padding()
                .foregroundStyle(Color.white)
                .background(memoColor)
                .shadow(radius: 3)
            Spacer()
        }
    }
}

struct ContentView: View {
    
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    
    @State var memoColor: Color = .blue
    @State var memoText: String = ""
    @State var isSheetShowing: Bool = false
    let colors: [Color] = [.blue, .green, .yellow, .indigo, .orange]
    
    var body: some View {
        NavigationStack {
            List(memos) {  memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)")
                            .font(.title)
                        Text(memo.created.toString)
                            .font(.body)
                            .padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(Color.white)
//                .background(memo.color)
                .shadow(radius: 3)
                .contextMenu {
                    ShareLink(item: memo.text)
                    Button {
                        removeMemo(memo)
                    } label: {
                        Image(systemName: "trash.slash")
                        Text("삭제")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Memos")
            .toolbar {
                ToolbarItem(placement:.topBarTrailing) {
                    Button("추가") {
                        memoText = ""
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(memoColor: $memoColor, memoText: $memoText, isSheetShowing: $isSheetShowing, colors: colors)
            }
        }
    }
    func removeMemo(_ targetMemo: Memo)  {
        modelContext.delete(targetMemo)
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Memo.self, inMemory: true)
}
