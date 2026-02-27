//
//  SavedMovie.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/27/26.
//

import SwiftData

@Model
final class SavedMovie {
    var id: Int
    var title: String
    var releaseDate: String
    var backdropPath: String?
    
    init(discoveredMovie: DiscoveredMovie) {
        self.id = discoveredMovie.id
        self.title = discoveredMovie.title
        self.releaseDate = discoveredMovie.releaseDate
        self.backdropPath = discoveredMovie.backdropPath
    }
}
