//
//  ContentView.swift
//  Calculator
//
//  Created by Yachae on 4/18/24.
//

import SwiftUI


import SwiftUI

struct ContentView: View {
    @State private var input: String = "0"
    
    let buttons: [[String]] = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                Spacer()
                Text(input)
                    .font(.system(size: 33)).bold()
                    .padding()
                    .foregroundColor(.white)
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button(action: { buttonTapped(button) }) {
                                Text(button)
                                    .font(.title)
                                    .frame(width: buttonWidth(button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(buttonWidth(button) / 2)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    func buttonTapped(_ button: String) {
        switch button {
        case "=":
            calculateResult()
        case "AC":
            input = "0"
        case "+/-":
            if let inputValue = Double(input) {
                input = String(inputValue * -1)
            }
        case "%":
            if let inputValue = Double(input) {
                input = String(inputValue / 100)
            }
        case ".":
            if !input.contains(".") {
                input += "."
            }
        default:
            if input == "0" && button != "." {
                input = button // '0' 다음에 숫자가 오면 그 숫자로 시작하도록 설정
            } else {
                input += button
            }
        }
    }

    
    func calculateResult() {
        let formattedString = input.replacingOccurrences(of: "/", with: "/").replacingOccurrences(of: "*", with: "*")
        if let result = NSExpression(format: formattedString).expressionValue(with: nil, context: nil) as? NSNumber {
            input = result.stringValue
        } else {
            input = "Error"
        }
    }
    
    func buttonWidth(_ button: String) -> CGFloat {
        return button == "0" ? (UIScreen.main.bounds.width - 5 * 12) / 2 + 12 : (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#Preview {
    ContentView()
}

