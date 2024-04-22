//
//  Memo.swift
//  SimpleMemo
//
//  Created by MadCow on 2024/4/22.
//

import Foundation
import SwiftData

@Model
class Memo {
    var uid: UUID = UUID()
    var title: String
    var date: String
//    var color: MemoColor
    
    init(title: String, date: String/*, color: MemoColor*/) {
        self.title = title
        self.date = date
//        self.color = color
    }
}

struct MemoColor: Codable {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
}

extension Date {
    var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}
