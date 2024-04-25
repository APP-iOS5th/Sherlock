//
//  MemoApp.swift
//  Memo
//
//  Created by JIHYE SEOK on 4/22/24.
//

import SwiftUI

@main
struct MemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self, inMemory: true)
        }
    }
}
