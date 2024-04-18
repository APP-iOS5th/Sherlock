//
//  ContentView.swift
//  Caculator
//
//  Created by JIHYE SEOK on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("12345")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(.black)
                .foregroundColor(.white)
                .font(.largeTitle)
            
            HStack {
                Text("AC")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("+/-")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("%")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("÷")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.orange)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
            HStack {
                Text("7")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("8")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("9")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("✕")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.orange)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
            HStack {
                Text("4")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("5")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("6")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("-")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.orange)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
            HStack {
                Text("1")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("2")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("3")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("+")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.orange)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            HStack {
                Text("0")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(".")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("=")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.orange)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
