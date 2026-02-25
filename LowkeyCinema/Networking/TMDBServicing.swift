//
//  TMDBServicing.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

protocol TMDBServicing {
    func fetchMovies() async -> Result<[DiscoveredMovie], any Error>
}
