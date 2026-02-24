//
//  DiscoveryViewModel.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI
import Combine

class DiscoveryViewModel: ObservableObject {
    let tmdbService: TMDBServicing
    
    @Published var movies: [DiscoveredMovie] = [
        DiscoveredMovie(name: "Star Wars"),
        DiscoveredMovie(name: "The Matrix"),
        DiscoveredMovie(name: "WarGames")
    ]
    
    init(tmdbService: TMDBServicing = TMDBService()) {
        self.tmdbService = tmdbService
    }
    
    func fetchMovies() {
        Task {
            await tmdbService.fetchMovies { result in
                // TODO: Add result to published var
            }
        }
    }
}
