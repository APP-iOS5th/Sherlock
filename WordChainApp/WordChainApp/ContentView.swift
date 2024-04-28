//
//  ContentView.swift
//  WordChainApp
//
//  Created by Yachae on 4/28/24.
//

import SwiftUI

struct ContentView: View {
  @State private var currentWord = "apple"
  @State private var userInput = ""
  @State private var score = 0
  
  var body: some View {
	VStack {
	  Text(currentWord)
	  TextField("Enter next word", text: $userInput)
	  
	  Button("submit") {
		
	  }
	  
	  Text("Score: \(score)")
	}
  }
  
  
  
}

#Preview {
    ContentView()
}
