//
//  SearchWordView.swift
//  APITest
//
//  Created by MadCow on 2024/4/29.
//

import SwiftUI

struct SearchWordView: View {
    @State private var findWord: String = ""
    @State private var words: [String] = []
    
    var body: some View {
        VStack {
            TextField("search", text: $findWord)
                .onChange(of: findWord) { _, newValue in
                    if !newValue.isEmpty {
                        fetchWord(searchWord: newValue)
                    } else {
                        words = []
                    }
                }
                .padding()
            
            List {
                if words.count > 0 {
                    ForEach(words, id: \.self) { word in
                        Text(word)
                    }
                }
            }
        }
    }
    
    func fetchWord(searchWord: String) {
        let session = URLSession.shared
        
        var str = "https://iapi.glosbe.com/iapi3/similar/similarPhrasesMany?p="
        str += searchWord
        str += "&l1=en&l2=ko&removeDuplicates=true&searchCriteria="
        str += "WORDLIST-ALPHABETICALLY-2-s%3BPREFIX-PRIORITY-2-s%3B"
        str += "TRANSLITERATED-PRIORITY-2-s%3BFUZZY-PRIORITY-2-s%3B"
//        str += "WORDLIST-ALPHABETICALLY-2-r%3BPREFIX-PRIORITY-2-r%3B"
//        str += "TRANSLITERATED-PRIORITY-2-r%3BFUZZY-PRIORITY-2-r&"
        str += "env=ko"
        
        guard let url = URL(string: str) else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error > \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("No Result!!")
                return
            }
            
            guard let data = data else {
                print("No Result Data")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let phrases = json["phrases"] as? [[String: Any]] {
                    var wordList: [String] = []
                    for phrase in phrases {
                        if let word = phrase["phrase"] as? String {
                            wordList.append(word)
                        }
                    }
                    words = wordList
                }
            } catch {
                print("error > \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}

#Preview {
    SearchWordView()
}
