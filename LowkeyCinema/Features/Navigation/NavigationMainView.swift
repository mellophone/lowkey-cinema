//
//  NavigationMainView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/27/26.
//

import SwiftUI

struct NavigationMainView: View {
    @State var rootScreen: NavigationScreen = .discovery
    @State var discoveryPath: [NavigationScreen] = []
    @State var savedPath: [NavigationScreen] = []
    
    let tmdbService: TMDBServicing
    
    // TODO: Find a way to retain scroll position for paths
    var path: Binding<[NavigationScreen]> {
        switch rootScreen {
        case .discovery: $discoveryPath
        case .saved: $savedPath
        }
    }
    
    var body: some View {
        VStack {
            NavigationStack(path: path) {
                rootScreen.content(with: tmdbService)
                    .navigationDestination(for: NavigationScreen.self) { screen in
                        screen.content(with: tmdbService)
                    }
            }

            NavigationBarView(withRoot: $rootScreen)
        }
    }
}

#Preview {
    NavigationMainView(
        tmdbService: TMDBService()
    )
}
