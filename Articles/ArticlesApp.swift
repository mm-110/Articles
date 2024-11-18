//
//  ArticlesApp.swift
//  Articles
//
//  Created by Massimo Montanaro on 18/11/24.
//

import SwiftUI
import SwiftData

@main
struct ArticlesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Article.self)
    }
}
