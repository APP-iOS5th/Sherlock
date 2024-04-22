//
//  MemoAddView.swift
//  SimpleMemo
//
//  Created by MadCow on 2024/4/22.
//

import SwiftUI
import SwiftData

struct MemoAddView: View {
    
    @Environment(\.modelContext) var modelContext
    var selectedMemo: Memo
    @State private var title: String = ""
//    @State private var date: String = ""
    
    @Binding var isSheetShowing: Bool
//    @Binding var memoColor: Color
    
//    let colors: [Color]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    isSheetShowing = false
                } label: {
                    Text("취소")
                }
                
                Spacer()
                
                Button {
//                    selectedMemo.title = title
//                    selectedMemo.date = Date().currentDateString
                    isSheetShowing = false
                    modelContext.insert(Memo(title: title, date: Date().currentDateString))
                } label: {
                    Text("완료")
                }
                .disabled(title.isEmpty)
            }
            
            HStack {
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: "checkmark.circle")
                        Spacer()
                    }
                    .padding()
                    .frame(height: 50)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .shadow(radius: 8)
                }
            }
            
            Divider()
                .padding()
            
            TextField("메모를 입력하세요", text: $title)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .shadow(radius: 3)
            Spacer()
        }
//        .onAppear(perform: {
//            title = selectedMemo.title
//            date = selectedMemo.date
//        })
        .padding()
    }
}

//#Preview {
//    MemoAddView()
//        .modelContainer(for: Memo.self)
//}
