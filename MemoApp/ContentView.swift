import SwiftUI
import SwiftData


@Model
class Memo {
    var id = UUID()
    var text: String
    var HexColor: String
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    var color: Color {
        Color(hex: HexColor)
    }
    
    init(text: String, HexColor: String, created: Date) {
        self.text = text
        self.HexColor = HexColor
        self.created = created
    }
}


struct ContentView: View {
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    @State var isSheetShowing: Bool = false

    
    let colors: [String] = ["87ceeb", "00ffff", "a020f0", "ffff00", "808080"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memos) { memo in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(memo.text)")
                                .font(.title)
                                .foregroundStyle(.black)
                            Text("\(memo.createdString)")
                                .font(.body)
                                .padding(.top)
                                .foregroundStyle(.black)
                        }
                        Spacer()
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(memo.color)
                    .shadow(radius: 3)
                    .padding()
                    .contextMenu {
                        ShareLink(item: memo.text)
                        Button {
                            modelContext.delete(memo)
                        } label:  {
                            Image(systemName: "trash.slash")
                            Text("삭제")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Memo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isSheetShowing = true
                    } label : {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(colors: colors, isSheetShowing: $isSheetShowing)
            }
        }
    }
    
   
    
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}


