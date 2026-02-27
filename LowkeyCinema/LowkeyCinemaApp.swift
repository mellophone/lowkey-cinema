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
            SavedMovie.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    let tmdbService = TMDBService()
    
    @State var discoveryPath: [Screen] = []
    @State var savedPath: [Screen] = []
    
    @State var rootScreen: Screen = .discovery
    
    var path: Binding<[Screen]> {
        switch rootScreen {
        case .discovery: $discoveryPath
        case .saved: $savedPath
        }
    }

    var body: some Scene {
        WindowGroup {
            // TODO: Extract navigation logic
            VStack {
                NavigationStack(path: path) {
                    rootScreen.content(with: tmdbService)
                        .navigationDestination(for: Screen.self) { screen in
                            Screen.content(for: screen, with: tmdbService)
                        }
                }

                HStack {
                    Spacer ()
                    
                    Button {
                        rootScreen = .discovery
                    } label: {
                        VStack {
                            Image(systemName: rootScreen == .discovery ? "map.fill" : "map")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 20)
                            Text("Discover")
                                .font(.caption)
                        }
                        .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    Spacer()
                    
                    Button {
                        rootScreen = .saved
                    } label: {
                        VStack {
                            Image(systemName: rootScreen == .saved ? "star.fill" : "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 20)
                            Text("Saved")
                                .font(.caption)
                        }
                        .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}

enum Screen {
    case discovery
    case saved
    
    @ViewBuilder
    static func content(for screen: Screen, with tmdbService: TMDBServicing) -> some View {
        switch screen {
        case .discovery: DiscoveryView(tmdbService: tmdbService)
        case .saved: Text("Saved Screen")
        }
    }
    
    @ViewBuilder
    func content(with tmdbService: TMDBServicing) -> some View {
        Self.content(for: self, with: tmdbService)
    }
}
