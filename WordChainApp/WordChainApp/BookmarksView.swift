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
	  List(viewModel.bookmarkedWords.sorted(), id: \.self) { word in
			Text(word)
		}
		.navigationTitle("북마크한 단어들")
	}
}

//#Preview {
//  BookmarksView()
//}
