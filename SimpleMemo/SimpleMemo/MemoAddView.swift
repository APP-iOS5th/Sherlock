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
    @State private var title: String = ""
    
    @Binding var isSheetShowing: Bool
    @Binding var memoColor: Color
    
    let colors: [Color]
    
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
                    isSheetShowing = false
                    
                    let uiColor = UIColor(memoColor)
                    
                    var red: CGFloat = 0
                    var green: CGFloat = 0
                    var blue: CGFloat = 0
                    var alpha: CGFloat = 0
                    
                    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                    
                    modelContext.insert(Memo(title: title, date: Date().currentDateString, color: MemoColor(red: red, green: green, blue: blue, alpha: alpha)))
                } label: {
                    Text("완료")
                }
                .disabled(title.isEmpty)
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(colors, id: \.self) { color in
                        Button {
                            memoColor = color
                        } label: {
                            HStack {
                                Spacer()
                                Image(systemName: "checkmark.circle")
                                Spacer()
                            }
                            .padding()
                            .frame(height: 50)
                            .foregroundStyle(.white)
                            .background(color)
                            .shadow(radius: 8)
                        }
                    }
                }
            }
            
            Divider()
                .padding()
            
            TextField("메모를 입력하세요", text: $title)
                .padding()
                .foregroundStyle(.white)
                .background(memoColor)
                .shadow(radius: 3)
            
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    MemoAddView()
//        .modelContainer(for: Memo.self)
//}
