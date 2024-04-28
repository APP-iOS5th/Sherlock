//
//  ContentView.swift
//  WordChainApp
//
//  Created by Yachae on 4/28/24.
//

import SwiftUI

struct ContentView: View {
  let starterWords = ["apple", "banana", "cherry", "date", "elderberry"]
  @State private var currentWord = ""
  @State private var userInput = ""
  @State private var score = 0
  @State private var alertTitle = ""
  @State private var showAlert = false
  @State private var usedWords = Set<String>()
  
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
	.onAppear {
	  self.currentWord = pickRandomWord()
	}
  }
  
  func pickRandomWord() -> String {
	return starterWords.randomElement() ?? "No word"
  }
  
  func submitButton() {
	let word = userInput.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
	let word2 = currentWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
	// 입력한 단어가 비어있거나, 이전에 사용된 단어인 경우, 혹은 현재 단어와 동일한 경우 먼저 검사
	guard word.count > 0, !usedWords.contains(word), word != currentWord else {
	  self.alertTitle = "잘못된 입력"
	  self.showAlert = true
	  self.userInput = ""
	  return
	}
	
	// 단어의 끝 알파벳과 입력한 단어의 첫 알파벳이 일치하는지 검사
	guard let lastChar = word2.last, let firstChar = word.first, lastChar == firstChar else {
	  self.alertTitle = "단어의 첫 글자가 이전 단어의 마지막 글자와 일치하지 않습니다."
	  self.showAlert = true
	  self.userInput = ""
	  return
	}
	
	// 유효성 검사
	fetchWordInfo(word: word) { isValid in
	  if isValid {
		DispatchQueue.main.async {
		  self.usedWords.insert(word)
		  self.currentWord = word
		  self.score += 1
		  self.userInput = ""
		  
		}
	  } else {
		DispatchQueue.main.async {
		  self.alertTitle = "잘못된 단어입니다"
		  self.showAlert = true
		}
	  }
	}
	
	self.userInput = ""
  }
  
  func resetGame() {
	self.currentWord = pickRandomWord()
	usedWords.removeAll()
	score = 0
  }
  
}

#Preview {
  ContentView()
}
