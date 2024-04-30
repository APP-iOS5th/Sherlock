//
//  BookmarksView.swift
//  WordChainApp
//
//  Created by Yachae on 4/29/24.
//

import SwiftUI
struct BookmarksView: View {
  @ObservedObject var viewModel: ContentViewViewModel
  
  
  var body: some View {
	List {
	  ForEach(Array(viewModel.bookmarkedWords).sorted(), id: \.self) { word in
		Text(word)
	  }
	  .onDelete(perform: deleteItems)
	}
	.navigationTitle("북마크한 단어들")
	.navigationBarItems(trailing: Button(action: {
	  viewModel.bookmarkedWords.removeAll()
	}) {
	  Text("모두 지우기")
	})
  }
  
  func deleteItems(at offsets: IndexSet) {
	for index in offsets {
	  let word = Array(viewModel.bookmarkedWords).sorted()[index]
	  viewModel.bookmarkedWords.remove(word)
	}
  }
}
