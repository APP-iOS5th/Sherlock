//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by mosi on 4/18/24.
//

import SwiftUI


enum CalculatorButtons: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case subtract = "-"
    case add = "+"
    case divide = "/"
    case multiply = "X"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .divide, .multiply, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
    var foregroundColors: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color(.black)
        default:
            return Color(.white)
        }
    }
}

enum Operation {
    case add, subtract, divide, multiply, none
}

