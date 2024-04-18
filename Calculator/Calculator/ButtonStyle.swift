//
//  ButtonStyle.swift
//  Calculator
//
//  Created by Yachae on 4/18/24.
//

import Foundation
import SwiftUI




struct CalculatorButtonStyle: ViewModifier {
    var backgroundColor: Color = .numberButton // 버튼 기본 배경색
    
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 80)
            .background(backgroundColor)
            .clipShape(Circle())
            .foregroundStyle(Color.white)
            .font(.system(size: 33))
    }
}


extension View {
    func calculatorButtonStyle(backgroundColor: Color = .numberButton) -> some View {
        self.modifier(CalculatorButtonStyle(backgroundColor: backgroundColor))
    }
}
