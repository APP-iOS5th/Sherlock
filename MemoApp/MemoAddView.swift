//
//  MemoAddView.swift
//  MemoApp
//
//  Created by mosi on 4/22/24.
//
import SwiftUI

struct MemoAddView: View {
    @Environment(\.modelContext) var modelContext
    
    let colors: [String]
    
    @Binding var isSheetShowing: Bool
    @State var memoText: String = ""
    @State var memoColor: String = "00ffff"
 
    
    var body: some View {
        VStack {
            HStack {
                Button{
                    isSheetShowing = false
                } label: {
                    Text("취소")
                }
                Spacer()
                Button {
                    let newMemo = Memo(text: memoText, HexColor: memoColor, created: Date())
                    addMemo(newMemo)
                    isSheetShowing = false
                } label: {
                    Text("완료")
                }
                .disabled(memoText.isEmpty)
            }
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            if Color(hex:color) == Color(hex:memoColor) {
                                Image(systemName: "checkmark.circle")
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(Color(hex:color))
                        .shadow(radius: color == memoColor ? 8 : 0 )
                    }
                }
            }
            
            Divider()
                .padding()
            
            TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                .padding()
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .background(Color(hex:memoColor))
                .shadow(radius: 3)
            Spacer()
        }
        .padding()
    }
    
    func addMemo(_ memo: Memo) {
        modelContext.insert(memo)
    }
}

