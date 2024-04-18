//
//  ContentView.swift
//  Calculators
//
//  Created by mosi on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    
    let button = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "+"],
        ["1", "2", "3", "-"],
        ["0", ".", "="]
    ]
    
    @State var input = "0"
    @State var temp = ""
    @State var operators = ""
    @State var isInteger = true
    @State var result = 0.0
    @State var numString1 = ""
    @State var numString2 = ""

    //버튼 각 버튼입력시 동작하는 함수
     func ButtonTapped(_ button: String) {
        switch button {
        case "+", "-", "*", "/", "%":
            operators = button
            numString1 = input
            input = "0"//numString1 == "" ? "0" : "0"
          
        case "AC":
            input = "0"
            numString1 = ""
            numString2 = ""
            result = 0.0
        case ".":
            if input.suffix(1) != "." && input.contains(".") == false {
                input += button
            }
        case "+/-":
            if input.prefix(1) == "-" {
                input = input.replacingOccurrences(of: "-", with: "")
            }
            else if input != "0"{
                input = "-"+input
            }
        case "=" :
            numString2 = input
            Calculate()
            isInteger = result.truncatingRemainder(dividingBy: 1.0) == 0 ? true : false
            input = isInteger ? String(Int(result)) : String(result)
            temp = input
            numString1 = ""
            numString2 = ""
        default:
            if temp == input {
                input = ""+button
            }
             else if input.contains(".") == false && button != "." && input.prefix(1) == "0" {
                input = ""+button
             }
            else {
                 input += button
             }
        
            
        }
        
    }
    
    //연산 계산 함수
    func Calculate()  {
        if let number1 = Double(numString1), let number2 = Double(numString2){
            switch(operators) {
            case "+":
                result = number1 + number2
            case "-":
                result = number1 - number2
            case "*":
                result = number1 * number2
            case "%":
                result = number1.truncatingRemainder(dividingBy:number2)
            case "/":
                result = number1 / number2
            default:
                break
            }
        }
    }
    
   
    var body: some View {
        VStack {
            Text(input+" ")
                .frame(width: 350, height: 80, alignment: .trailing)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
                
        }
        VStack {
            ForEach(button, id: \.self ) { row in
                HStack {
                    ForEach(row, id: \.self) { buttons in
                        Button(action: {
                            self.ButtonTapped(buttons)
                        }){
                            Text(buttons)
                                .frame(width: 80, height: 80)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(40)
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
