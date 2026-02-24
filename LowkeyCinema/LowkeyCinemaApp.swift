//
//  LowkeyCinemaApp.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/23/26.
//

import SwiftUI
import SwiftData

@main
struct LowkeyCinemaApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    let tmdbService = TMDBService()

    var body: some Scene {
        WindowGroup {
            DiscoveryView(tmdbService: tmdbService)
        }
        .modelContainer(sharedModelContainer)
    }
}
