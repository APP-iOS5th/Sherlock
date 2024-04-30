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
	NavigationView {
	  VStack {
		Text(viewModel.currentWord)
		  .padding()
		
		TextField("Enter next word", text: $viewModel.userInput)
		  .textFieldStyle(RoundedBorderTextFieldStyle())
		  .padding()
		
		Button("Submit") {
		  viewModel.submitButton()
		}
		.padding()
		
		Button("북마크하기") {
		  viewModel.bookmarkCurrentWord()
		}
		.padding()
		
		Text("Score: \(viewModel.score)")
		
		NavigationLink(destination: BookmarksView(viewModel: viewModel)) {
		  Text("북마크 보기")
		}
		.padding()
		
		Button(action: {
		  viewModel.darkModeSwitch()
		}, label: {
		  Text(viewModel.isDarkMode ? "라이트모드" : "다크모드")
			.foregroundColor(viewModel.isDarkMode ? .black : .white)
			.background(viewModel.isDarkMode ? Color.white : Color.black)
		})
		.preferredColorScheme(viewModel.isDarkMode ? .dark : .light)
		
		
		.alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
		  Button("다시하기") {
			viewModel.resetGame()
		  }
		} message: {
		  Text("당신의 점수는 \(viewModel.score)점 입니다.")
		}
		.navigationTitle("끝말잇기게임")
	  }
	  .onAppear {
		viewModel.pickRandomWord()
	  }
	}
  }
}

#Preview {
  ContentView()
}
