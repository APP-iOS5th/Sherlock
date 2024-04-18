//
//  ContentView.swift
//  Calculator
//
//  Created by Yachae on 4/18/24.
//

import SwiftUI



struct ContentView: View {
    @State private var totalNumber: String = "0"
    private let buttonData: [[String]] = [
        ["7", "8", "9", "X"],
        ["4", "5", "6", "X"],
        ["1", "2", "3", "+"],
        ["0", "0", ",", "="]
    ]
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // 배경화면 검은색
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundStyle(Color.white)
                }
                
                HStack {
                    Button {
                        totalNumber = "0"
                    } label: {
                        Text("C").calculatorButtonStyle(backgroundColor: .gray)
                        Text("/").calculatorButtonStyle(backgroundColor: .gray)
                        Text("%").calculatorButtonStyle(backgroundColor: .gray)
                        Text("$").calculatorButtonStyle(backgroundColor: .gray)
                    }
                }
                
                ForEach(buttonData, id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) { button in
                            Button {
                                if totalNumber == "0" {
                                    totalNumber = "7"
                                } else {
                                    totalNumber += "7"
                                }
                            } label: {
                                Text(button).calculatorButtonStyle()
                            }
                        }
                    }
                }
            }
        }
    }
}







#Preview {
    ContentView()
}
