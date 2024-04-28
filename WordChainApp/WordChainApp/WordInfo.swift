//
//  WordInfo.swift
//  WordChainApp
//
//  Created by Yachae on 4/28/24.
//

import Foundation

struct WordInfo: Decodable {
  let word: String
}

func fetchWordInfo(word: String, compoletion: @escaping (Bool) -> Void) {
  let urlString = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
  guard let url = URL(string: urlString) else {
	compoletion(false)
	return
  }
  
  URLSession.shared.dataTask(with: url) { data,response, error in
	if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
	  compoletion(true)
	} else {
	  compoletion(false)
	}
  }.resume()
}
