//
//  TMDBService.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import Foundation

class TMDBService: TMDBServicing {
    func fetchMovies(completion: @escaping (Result<[DiscoveredMovie], any Error>) -> Void) async {
        // TODO: Refactor, extract logic and constants, and utilize completion
        
        print("Building request")
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "include_adult", value: "false"),
          URLQueryItem(name: "include_video", value: "false"),
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "sort_by", value: "popularity.desc"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer \(Config.apiKey)"
        ]

        print("Request built")
        if let (data, _) = try? await URLSession.shared.data(for: request) {
            print("Request successful")
            print(String(decoding: data, as: UTF8.self))
        } else {
            print("Request failed")
        }
    }
}

// TODO: Extract
enum Config {
    static let apiKey: String = {
        guard let key = Bundle.main.object(
            forInfoDictionaryKey: "TMDB_TOKEN"
        ) as? String else {
            fatalError("API Token not found")
        }
        return key
    }()
}
