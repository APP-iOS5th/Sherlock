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
  @State private var alertTitle = ""
  @State private var showAlert = false
  
  var body: some View {
	VStack {
	  Text(currentWord)
	  TextField("Enter next word", text: $userInput)
	  
	  Button("submit") {
		submitButton()
	  }
	  
	  Text("Score: \(score)")
	}
	.alert(alertTitle, isPresented: $showAlert) {
	  Button("다시하기") {
		resetGame()
	  }
	} message: {
	  Text ("당신의 점수는 \(score)점 입니다.")
	}
  }
  
  func submitButton() {
	let word = userInput.lowercased()
	
	// 유효성 검사
	fetchWordInfo(word: word) { isValid in
	  if isValid && word.last == currentWord.first {
		DispatchQueue.main.async {
		  self.currentWord = word
		  self.score += 1
		  self.userInput = ""
		}
	  } else {
		DispatchQueue.main.async {
		  self.alertTitle = "Lose"
		  self.showAlert = true
		}
	  }
	}
  }
  
  func resetGame() {
	currentWord = "apple"
	score = 0
  }
  
}

#Preview {
    ContentView()
}
