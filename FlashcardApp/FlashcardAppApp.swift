//
//  FlashcardAppApp.swift
//  FlashcardApp
//
//  Created by Cristian Cretu on 27.11.2023.
//

import SwiftUI
import SwiftData

@main
struct FlashcardAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Deck.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(sharedModelContainer)
        .modelContainer(for: Deck.self)
        
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
