//
//  DiscoveryViewModel.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI
import Combine

class DiscoveryViewModel: ObservableObject {
    @Published var movies: [DiscoveredMovie] = [
        DiscoveredMovie(name: "Star Wars"),
        DiscoveredMovie(name: "The Matrix"),
        DiscoveredMovie(name: "WarGames")
    ]
}
