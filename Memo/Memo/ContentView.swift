//
//  ContentView.swift
//  Memo
//
//  Created by JIHYE SEOK on 4/22/24.
//

import SwiftUI
//import SwiftData

//@Model
struct Memo: Identifiable {
    let id: UUID = UUID()
    var text: String
    var color: Color
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
}

class MemoStore: ObservableObject {
    @Published var memos: [Memo] = []
    //@Environment(\.modelContext) var modelContext
    
    func addMemo(_ text: String, color: Color) {
        let memo = Memo(text: text, color: color, created: Date())
        memos.insert(memo, at: 0)
    }
    
    func removeMemo(_ targetMemo: Memo)  {
        if let index = memos.firstIndex(where: { $0.id == targetMemo.id }) {
            memos.remove(at: index)
        }
    }
    
    
}

struct ContentView: View {
    
    @ObservedObject var memoStore: MemoStore = MemoStore()
    
    @State var memoColor: Color = .blue
    @State var memoText: String = ""
    @State var isSheetShowing: Bool = false
    let colors: [Color] = [.blue, .green, .yellow, .indigo, .orange]
    // @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(memoStore.memos) {  memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)")
                            .font(.title)
                        Text(memo.createdString)
                            .font(.body)
                            .padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(Color.white)
                .background(memo.color)
                .shadow(radius: 3)
                .contextMenu {
                    ShareLink(item: memo.text)
                    Button {
                        memoStore.removeMemo(memo)
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
                MemoAddView(memoStore: memoStore, memoColor: $memoColor, memoText: $memoText, isSheetShowing: $isSheetShowing, colors: colors)
            }
        }
    }
    
}


#Preview {
    ContentView()
}
