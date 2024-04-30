//
//  WordChainLogic.swift
//  WordChainApp
//
//  Created by Yachae on 4/28/24.
//

import Foundation

class ContentViewViewModel: ObservableObject {
  let starterWords = ["apple", "banana", "cherry", "date", "elderberry"]
  @Published var currentWord = ""
  @Published var userInput = ""
  @Published var score = 0
  @Published var alertTitle = ""
  @Published var showAlert = false
  @Published var usedWords = Set<String>()
  @Published var bookmarkedWords = Set<String>()
  @Published var isDarkMode = false
  
  
  
  private var wordManager = WordManager()
  
  init() {
	pickRandomWord()
  }
  
  func pickRandomWord() {
	self.currentWord = wordManager.pickRandomWord()
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
	
	self.userInput = "" // 입력 초기화
  }
  // 다크모드 전환
  func darkModeSwitch() {
	isDarkMode.toggle()
	
  }
  
  // 북마크 기능
  func bookmarkCurrentWord() {
	bookmarkedWords.insert(currentWord)
  }
  // 영구저장
  func saveBookmarks() {
	UserDefaults.standard.set(Array(bookmarkedWords), forKey: "BookmarkedWords")
  }
  // 북마크 불러오기
  func loadBookmarks() {
	if let savedWords = UserDefaults.standard.array(forKey: "BookmarkedWords") as? [String] {
	  bookmarkedWords = Set(savedWords)
	  if bookmarkedWords.isEmpty {
		self.alertTitle = "북마크가 없습니다."
		self.showAlert = true
	  } else {
		self.alertTitle = "북마크가 없습니다"
		self.showAlert = true
	  }
	}
  }
  // 게임 초기화
  func resetGame() {
	self.currentWord = wordManager.pickRandomWord()
	usedWords.removeAll()
	score = 0
  }
}
