//
//  MovieCardView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI

struct MovieCardView: View {
    let discoveredMovie: DiscoveredMovie
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .bottom) {
                Text(discoveredMovie.cardTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .font(.title)
                
                Spacer()
            }
            .shadow(color: Color.black, radius: 5)
        }
        .padding(5)
        .frame(maxWidth: .infinity)
        .frame(height: 160)
        .background {
            if let backgroundPath = discoveredMovie.backdropPath {
                // TODO: Extract URL
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
