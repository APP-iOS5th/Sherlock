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
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="],
    ]
    
    let etcMarks: [String] = ["C"]
    let marks: [String] = ["/", "*", "-", "+"]
    
    @State private var resultIsShowing: Bool = true
    @State private var result: Double = 0
    @State private var calculateTarget: String = ""
    @State private var format: String = "%.0f"
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Text(resultIsShowing ? String(format: format, result) : calculateTarget)
                        .font(.system(size: 70))
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding()
                
                ForEach(calculatorList, id: \.self) { list in
                    HStack {
                        ForEach(list, id: \.self) { li in
                            let color = etcMarks.contains(li) ? Color(UIColor.lightGray) : marks.contains(li) ? .orange : Color(UIColor.darkGray)
                            Button {
                                buttonTapped(text: li)
                            } label: {
                                ZStack {
                                    if li != "0" {
                                        Circle()
                                            .foregroundStyle(color)
                                    } else {
                                        Capsule()
                                            .frame(width: geometry.size.width / 2, height: 80)
                                            .foregroundStyle(color)
                                    }
                                    
                                    Text(li)
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundStyle(etcMarks.contains(li) ? .black : marks.contains(li) ? .black : .white)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .background(.black)
        }
    }
    
    func buttonTapped(text: String) {
        if !marks.contains(text) && !etcMarks.contains(text) && text != "=" {
            resultIsShowing = false
            calculateTarget += text
        } else if marks.contains(text) {
            if !marks.contains(String(calculateTarget.suffix(1))) {
                calculateTarget += text
            }
        } else if etcMarks.contains(text) {
            resultIsShowing = true
            calculateTarget = ""
        } else if text == "=" {
            if marks.contains(String(calculateTarget.suffix(1))) {
                calculateTarget = "Invalid Value"
                return
            }
            let expression = NSExpression(format: calculateTarget)
            if let value = expression.expressionValue(with: nil, context: nil) as? Double {
                print(value)
                if String(value).contains(".") {
                    self.format = "%.2f"
                }
                calculateTarget = String(format: format, value)
            } else {
                calculateTarget = "Invalid input"
            }
            print(calculateTarget)
        }
    }
}

#Preview {
    ContentView()
}
