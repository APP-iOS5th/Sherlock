//
//  WordManager.swift
//  WordChainApp
//
//  Created by Yachae on 4/28/24.
//


import Foundation

class WordManager {
  let starterWords = ["apple", "banana", "cherry", "date", "elderberry"]
  
  func pickRandomWord() -> String {
	return starterWords.randomElement() ?? "No word"
  }
}

