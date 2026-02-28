//
//  SavedMoviesView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/27/26.
//

import SwiftUI
import SwiftData

struct SavedMoviesView: View {
    @Query var savedMovies: [SavedMovie]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(savedMovies.sorted(by: { $0.title < $1.title })) { movie in
                    let discoveredMovie = DiscoveredMovie(
                        id: movie.id,
                        title: movie.title,
                        releaseDate: movie.releaseDate,
                        backdropPath: movie.backdropPath
                    )
                    
                    MovieCardView(discoveredMovie: discoveredMovie)
                }
            }
        }
        .padding(5)
    }
}

// TODO: Set up model container for previews
#Preview {
    SavedMoviesView()
}
