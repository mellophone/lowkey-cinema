//
//  DiscoveryView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI
import SwiftData

struct DiscoveryView: View {
    @StateObject private var viewModel: DiscoveryViewModel
    
    init(tmdbService: TMDBServicing = TMDBService()) {
        self._viewModel = StateObject(
            wrappedValue: DiscoveryViewModel(tmdbService: tmdbService)
        )
    }
    
    var body: some View {
        // TODO: Extract movie scroll view for sharing
        VStack {
            ScrollView {
                // TODO: Add columns for wider screens
                VStack {
                    ForEach(viewModel.movies) { movie in
                        MovieCardView(discoveredMovie: movie)
                    }
                }
            }
        }
        .padding(5)
        .onAppear {
            Task {
                await viewModel.refreshMovies()
            }
        }
    }
}

#Preview {
    DiscoveryView()
}
