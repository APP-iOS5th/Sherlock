import SwiftUI

struct ContentView: View {
    
    @State private var setInput : String = ""
    @State private var temp : String = ""
    @State private var isInteger : Bool = true
    @State private var number1 : Double? = 0.0
    @State private var number2 : Double? = 0.0
    @State private var operators : String = ""
    @State private var result : Double = 0.0
    @State private var done = ""
    
    let buttons : [[CalculatorButtons]] = [
        [ .clear, .negative , .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    func Calculate() -> Double {
        
        switch(operators) {
        case "+":
            result = number1! + number2!
        case "-":
            result = number1! - number2!
        case "X":
            result = number1! * number2!
        case "/":
            result = number1! / number2!
        case "%":
            result = number1!.truncatingRemainder(dividingBy:number2!)
        default:
            break
        }
        return result
    }
    
    var body: some View {
        VStack{
            Text(setInput+" ")
                .frame(maxWidth: 345, maxHeight: 60, alignment: .trailing)
                .background(.gray)
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .cornerRadius(10)
            
            ForEach(buttons, id:\.self) { row in
                HStack {
                    ForEach(row, id:\.self) { buttonchars in
                        Button(action: {
                            if buttonchars.rawValue == "AC" {
                                setInput = ""
                            }
                            else if buttonchars.rawValue == "=" || done == "=" {
                                number2 = Double(setInput)
                                result = Calculate()
                                isInteger = result.truncatingRemainder(dividingBy: 1.0) == 0 ? true : false
                                setInput = isInteger ? String(Int(result)) : String(format: "%.2f", result)
                                
                                
                                
                            }
                            else if buttonchars.rawValue == "%" || buttonchars.rawValue == "/" || buttonchars.rawValue == "X" || buttonchars.rawValue == "-" || buttonchars.rawValue == "+"  {
                                operators = buttonchars.rawValue
                                number1 = Double(setInput)
                                setInput = ""
                                
                                
                                
                            }
                            else if buttonchars.rawValue == "+/-" {
                                if setInput.prefix(1) != "-" && setInput != "0" {
                                    setInput = "-"+setInput
                                }
                                else if setInput.prefix(1) == "-"{
                                    setInput = setInput.replacingOccurrences(of: "-", with: "")
                                }
                            } else {
                                setInput += buttonchars.rawValue
                            }
//                            else if !(setInput.isEmpty && (buttonchars.rawValue == "0" || buttonchars.rawValue == ".")) {
//                                setInput += buttonchars.rawValue
//                            }
                            
                        })
                        {
                            if "0" <= buttonchars.rawValue &&  buttonchars.rawValue <= "9" || buttonchars.rawValue == "." {
                                if buttonchars.rawValue == "0" || buttonchars.rawValue == "." {
                                    Text(buttonchars.rawValue)
                                        .frame(width:125, height: 80)
                                        .bold()
                                        .background(.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(30)
                                }
                                else {
                                    Text(buttonchars.rawValue)
                                        .frame(width:80, height: 80)
                                        .bold()
                                        .background(.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(30)
                                }
                            }
                            else if buttonchars.rawValue == "AC" || buttonchars.rawValue == "+/-" || buttonchars.rawValue == "%" {
                                Text(buttonchars.rawValue)
                                    .frame(width: 80, height: 80)
                                    .bold()
                                    .background(.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                            }
                            else {
                                Text(buttonchars.rawValue)
                                    .frame(width: 80, height: 80)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
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
