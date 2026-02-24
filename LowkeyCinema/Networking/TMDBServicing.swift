//
//  TMDBServicing.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

protocol TMDBServicing {
    func fetchMovies(completion: @escaping (Result<[DiscoveredMovie], Error>) -> Void) async
}
