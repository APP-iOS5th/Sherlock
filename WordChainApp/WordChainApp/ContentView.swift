//
//  ContentView.swift
//  WordChainApp
//
//  Created by Yachae on 4/28/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ContentViewViewModel()
  
  var body: some View {
	VStack {
	  Text(viewModel.currentWord)
	  TextField("Enter next word", text: $viewModel.userInput)
	  
	  Button("submit") {
		viewModel.submitButton()
	  }
	  
	  Text("Score: \(viewModel.score)")
	}
	.alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
	  Button("다시하기") {
		viewModel.resetGame()
	  }
	} message: {
	  Text("당신의 점수는 \(viewModel.score)점 입니다.")
	}
	.onAppear {
	  viewModel.pickRandomWord()
	}
  }
}

#Preview {
  ContentView()
}
