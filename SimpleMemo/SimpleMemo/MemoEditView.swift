//
//  MemoEditView.swift
//  SimpleMemo
//
//  Created by MadCow on 2024/4/22.
//

import SwiftUI

struct CustomButton: View {
    @Binding var buttonName: String
    var buttonColor: Color
    var buttonAction: () -> Void
    
    var body: some View {
        Button(buttonName) {
            buttonAction()
        }
        .frame(width: 100, height: 25)
        .padding()
        .foregroundColor(.white)
        .background(buttonColor)
        .clipShape(Capsule())
    }
}

struct MemoEditView: View {
    
    @State private var title: String = ""
    @State private var date: String = ""
    @State private var editOrSave: String = "Edit"
    @State private var cancelButton: String = "Cancel"
    @State private var editMode: Bool = true
    @State private var timer: Timer?
    
    @Binding var selectedMemo: Memo?
    @Binding var memoEditAppear: Bool
    
    var body: some View {
        VStack {
            Spacer()
        
            HStack {
                Text("날짜: ")
                TextField("날짜", text: $date)
                    .disabled(true)
                    .background(Color(UIColor.lightGray))
            }
            HStack {
                Text("내용: ")
                TextField("내용", text: $title)
                    .disabled(editMode)
                    .background(editMode ? Color(UIColor.lightGray) : .white)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                CustomButton(buttonName: $cancelButton, buttonColor: .red) {
                    memoEditAppear = false
                }
                Spacer()
                CustomButton(buttonName: $editOrSave, buttonColor: .blue, buttonAction: {
                    editMode.toggle()
                    if editMode {
                        if let selectMemo = selectedMemo {
                            selectMemo.title = title
                            selectMemo.date = date
                        }
                        
                        memoEditAppear = false
                    } else {
                        editOrSave = "Save"
                    }
                })
                Spacer()
            }
        }
        .onAppear {
            if let selectMemo = selectedMemo {
                title = selectMemo.title
            }
            date = Date().currentDateString
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                date = Date().currentDateString
            }
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
        .padding()
    }
}
