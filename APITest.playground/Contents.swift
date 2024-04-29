
import SwiftUI

struct WordMeaning: Decodable {
    let partOfSpeech: String
    let definitions: [Definition]
}

struct Definition: Decodable {
    let definition: String
    let synonyms: [String]
}

struct WordData: Decodable {
    let meanings: [WordMeaning]
}

let session = URLSession.shared

func fetchData(url: URL) {
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
            let decoder = JSONDecoder()
            let wordData = try decoder.decode([WordData].self, from: data)
            let wordResponse = wordData[0].meanings[0].definitions[0].definition
            
            print(wordResponse)
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }
    
    task.resume()
}

let word: String = "word"
let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word.lowercased())")!

fetchData(url: url)

/**
 //
 //  APITestView.swift
 //  MuscleMemory
 //
 //  Created by MadCow on 2024/4/26.
 //

 import SwiftUI
 import SwiftSoup

 struct APITestView: View {
     @State private var word: String = ""
     
     let session = URLSession.shared
     var body: some View {
         VStack {
             TextField("단어 입력", text: $word)
                 .padding()
                 .clipShape(Capsule())
                 .border(.black, width: 2)
             
             Button {
                 fetchData(word: word)
             } label: {
                 Text("체크")
                     .frame(maxWidth: .infinity)
             }
             .padding()
             .clipShape(Capsule())
             .border(.black, width: 2)
             .disabled(word.isEmpty)
         }
         .padding()
     }
     
     func fetchData(word: String) {
         let url = URL(string: "https://glosbe.com/en/ko/\(word.lowercased())")!
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
             if let html = String(data: data, encoding: .utf8) {
                 do {
                     let document = try SwiftSoup.parse(html)
                     let paragraph = try document.select(".align-top.inline.leading-10.text-primary-700").text()
                     print("paragraph > \(paragraph.split(separator: " ")[0])")
                 } catch {
                     print("Error parsing HTML: \(error)")
                 }
             }
         }
         task.resume()
     }
 }

 #Preview {
     APITestView()
 }

 */
