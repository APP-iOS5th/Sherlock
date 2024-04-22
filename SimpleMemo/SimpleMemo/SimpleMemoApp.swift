//
//  SimpleMemoApp.swift
//  SimpleMemo
//
//  Created by MadCow on 2024/4/22.
//

import SwiftUI
import SwiftData

@main
struct SimpleMemoApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Memo.self)
    }
}
