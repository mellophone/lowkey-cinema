//
//  DiscoveryViewModel.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI
import Combine

final class DiscoveryViewModel: ObservableObject {
    @Published var movies: [DiscoveredMovie] = []
    @Published var scrollID: Int?

    private let tmdbService: TMDBServicing
    
    init(tmdbService: TMDBServicing = TMDBService()) {
        self.tmdbService = tmdbService
    }
    
    public func onAppear() async {
        await performInitialFetch()
    }
    
    private func performInitialFetch() async {
        if movies.isEmpty {
            await refreshMovies()
        }
    }
    
    @MainActor
    private func refreshMovies() async {
        let result = await tmdbService.fetchMovies()
        
        switch result {
        case .success(let movies):
            self.movies = movies
        case .failure:
            break
        }
    }
}
