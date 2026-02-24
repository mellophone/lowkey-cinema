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
        VStack {
            Button {
                viewModel.fetchMovies()
            } label: {
                Text("Fetch movies")
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.movies, id: \.name) { movie in
                        Text(movie.name)
                    }
                }
            }
        }
    }
}

#Preview {
    DiscoveryView()
}
