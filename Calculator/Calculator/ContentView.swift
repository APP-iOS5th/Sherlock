//
//  ContentView.swift
//  Calculator
//
//  Created by 홍준범 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var number = ""
    var body: some View {
        VStack {
            TextField("hi", text: $number)
        }
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "sum")
                }
                Button {
                    
                } label: {
                    Image(systemName: "plus.forwardslash.minus")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "percent")
                }
                Button {
                    
                } label: {
                    Image(systemName: "divide.square.fill")
                }
            }
            HStack {
                Button {
                    number += "7"
                } label: {
                    Image(systemName: "7.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "8.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "9.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "multiply.square.fill")
                }
            }
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "4.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "5.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "6.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "minus.square.fill")
                }
            }
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "1.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "2.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "3.square.fill")
                }
                Button {
                    
                } label: {
                    Image(systemName: "plus.square.fill")
                }
            }
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "0.square.fill")
                }
                ZStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "circle")
                    }
                    Text(".")
                }
                Button {
                    
                } label: {
                    Image(systemName: "equal.square.fill")
                }
            }
        }
        .font(.system(size: 80))
    }
}

#Preview {
    ContentView()
}
