//
//  MemoModel.swift
//  Memo
//
//  Created by JIHYE SEOK on 4/23/24.
//

import SwiftUI
import SwiftData


extension Color {
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
}


@Model
class Memo {
    var id = UUID()
    var text: String
    var colorHex: String
    var created: Date

    @Transient
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            return dateFormatter.string(from: created)
        }
    }

    @Transient
    var color: Color {
        return Color(hex: colorHex)
    }


    init(text: String, color: Color, created: Date) {
        self.text = text
        self.colorHex = Memo.hexStringFromColor(color: color)
        self.created = created
    }

    static func hexStringFromColor(color: Color) -> String {
        let components = color.resolve(in: EnvironmentValues())
        let r: CGFloat = CGFloat(components.red)
        let g: CGFloat = CGFloat(components.green)
        let b: CGFloat = CGFloat(components.blue)

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        print(hexString)
        return hexString
     }
}

//#Preview {
//    MemoModel()
//}
