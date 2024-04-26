
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
