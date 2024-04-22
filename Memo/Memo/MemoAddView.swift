//
//  MemoAddView.swift
//  Memo
//
//  Created by JIHYE SEOK on 4/22/24.
//

import SwiftUI

struct MemoAddView: View {
    var memoStore: MemoStore
    @Binding var memoColor: Color
    @Binding var memoText: String
    @Binding var isSheetShowing: Bool
    let colors: [Color]
    
    var body: some View {
        VStack {
            HStack {
                Button("취소") {
                    isSheetShowing = false
                }
                Spacer()
                Button("완료") {
                    memoStore.addMemo(memoText, color: memoColor)
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
        .padding()
    }
}

//#Preview {
//    MemoAddView()
//}
