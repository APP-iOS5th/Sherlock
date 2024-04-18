//
//  ContentView.swift
//  Calculator
//
//  Created by MadCow on 2024/4/18.
//

import SwiftUI

//enum mark: String {
//    case plus = "+"
//    case minus = "-"
//    case multiple = "X"
//    case divide = "/"
//    case equal = "="
//}

struct ContentView: View {
    
    let calculatorList: [[String]] = [
        ["C", "+/-", "%", "/"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="],
    ]
    
    let etcMarks: [String] = ["C", "+/-", "%"]
    let marks: [String] = ["/", "X", "-", "+", "="]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("0")
            }
            .padding()
                        
            ForEach(calculatorList, id: \.self) { list in
                HStack {
                    ForEach(list, id: \.self) { li in
                        let color = etcMarks.contains(li) ? Color(UIColor.lightGray) : marks.contains(li) ? .orange : Color(UIColor.darkGray)
                        Button {
                            
                        } label: {
                            ZStack {
                                if li != "0" {
                                    Circle()
                                        .foregroundStyle(color)
                                } else {
                                    Capsule()
                                        .frame(width: 180, height:75)
                                        .foregroundStyle(color)
                                }
                                
                                Text(li)
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundStyle(etcMarks.contains(li) ? .black : .white)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
