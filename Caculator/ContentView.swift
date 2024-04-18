//
//  ContentView.swift
//  Caculator
//
//  Created by JIHYE SEOK on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var calculate = "33333"
    
    func cacluateAction() {
        print("click")
    }
    
    var body: some View {
        VStack {
            
            Text(calculate)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                .background(.black)
                .foregroundColor(.white)
                .font(.largeTitle)
            
            HStack {
                Button(action: cacluateAction){
                    Text("AC")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("+/-")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("%")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("÷")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
            
            HStack {
                Button(action: cacluateAction){
                    Text("7")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("8")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("9")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("✕")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
            
            HStack {
                Button(action: cacluateAction){
                    Text("4")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("5")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("6")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("-")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
            
            HStack {
                Button(action: cacluateAction){
                    Text("1")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("2")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("3")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("+")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
            HStack {
                Button(action: cacluateAction){
                    Text("0")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text(".")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                Button(action: cacluateAction){
                    Text("=")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(.orange)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
