//
//  DiscoveryView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/24/26.
//

import SwiftUI
import SwiftData

struct DiscoveryView: View {
    @StateObject private var viewModel = DiscoveryViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.movies, id: \.name) { movie in
                        Text(movie.name)
                    }
                }
            }
        }
        .navigationTitle("Movies")
    }
}

#Preview {
    DiscoveryView()
}
