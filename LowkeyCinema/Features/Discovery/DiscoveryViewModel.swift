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
    
    @Published var movies: [DiscoveredMovie] = []
    
    init(tmdbService: TMDBServicing = TMDBService()) {
        self.tmdbService = tmdbService
    }
    
    @MainActor
    func refreshMovies() async {
        let result = await tmdbService.fetchMovies()
        
        switch result {
        case .success(let movies):
            self.movies = movies
        case .failure:
            break
        }
    }
}
