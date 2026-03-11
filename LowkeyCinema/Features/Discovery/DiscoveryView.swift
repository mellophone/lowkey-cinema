//
//  DiscoveryView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI
import SwiftData

struct DiscoveryView: View {
    @ObservedObject var viewModel: DiscoveryViewModel
    
    init(viewModel: DiscoveryViewModel = DiscoveryViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        // TODO: Extract movie scroll view for sharing
        VStack {
            ScrollView {
                // TODO: Add columns for wider screens
                LazyVStack {
                    ForEach(viewModel.movies) { movie in
                        MovieCardView(discoveredMovie: movie)
                            .id(movie.id)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $viewModel.scrollID, anchor: .top)
        }
        .padding(5)
        .task {
            await viewModel.onAppear()
        }
    }
}

#Preview {
    DiscoveryView()
}
