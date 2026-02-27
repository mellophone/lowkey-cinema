//
//  MovieCardView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI
import SwiftData

struct MovieCardView: View {
    @Environment(\.modelContext) var modelContext
    @Query var savedMovies: [SavedMovie]
    
    let discoveredMovie: DiscoveredMovie
    
    var savedMovie: SavedMovie? {
        savedMovies.first
    }
    
    var isSaved: Bool {
        savedMovie != nil
    }
    
    init(discoveredMovie: DiscoveredMovie) {
        self.discoveredMovie = discoveredMovie
        self._savedMovies = Query(
            filter: #Predicate<SavedMovie> {
                $0.id == discoveredMovie.id
            }
        )
    }
    
    func toggleSave() {
        if let savedMovie {
            modelContext.delete(savedMovie)
        } else {
            modelContext.insert(
                SavedMovie(discoveredMovie: discoveredMovie)
            )
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()

                Button {
                    toggleSave()
                } label: {
                    Image(systemName: isSaved ? "star.fill" : "star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 25)
                        .foregroundStyle(Color.white)
                        .font(.title)
                }
            }
            
            Spacer()
            
            HStack(alignment: .bottom) {
                Text(discoveredMovie.cardTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .font(.title)
                
                Spacer()
            }
        }
        .shadow(color: Color.black, radius: 5)
        .padding(5)
        .frame(maxWidth: .infinity)
        .frame(height: 160)
        .background {
            if let backgroundPath = discoveredMovie.backdropPath {
                // TODO: Extract URL, optimize, and cache
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(backgroundPath)")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            } else {
                Color.gray
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    VStack(spacing: 20) {
        MovieCardView(discoveredMovie: .starWars)
        MovieCardView(discoveredMovie: .zootopia2)
    }
    .padding(5)
}
