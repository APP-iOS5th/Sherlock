//
//  ContentView.swift
//  Caculator
//
//  Created by JIHYE SEOK on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    let buttonNumber: [[String]] = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "✕"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", "0", ".", "="]
    ]
    
    @State private var calculate = "0"
    
    enum operators: String {
        case plus = "+"
        case minus = "-"
        case multiple = "X"
        case division = "/"
        case percent = "%"
        case initial = "AC"
        case chgSign = "+/-"
    }
    
    func cacluateAction(formula: String) {
        
//        for num in formula {
//            switch
//        }
        //switch for
    }
    
    var body: some View {
        VStack {
            
            Text(calculate)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding()
                .background(.black.opacity(0.7))
                .foregroundColor(.white)
                .font(.system(size: 48))
            
            ForEach(buttonNumber, id: \.self ) { lineNum in
                HStack {
                    ForEach(lineNum, id: \.self) { numChar in
                        Button {
                            if calculate == "0" {
                                calculate = numChar
                            } else {
                                calculate += numChar
                            }
                        } label: {
                            Text(numChar)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.gray.opacity(0.7))
                                .foregroundColor(.white)
                                .font(.system(size: 48))
                                .bold()
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
