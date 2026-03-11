//
//  NavigationScreen.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/27/26.
//

import SwiftUI

enum NavigationScreen {
    case discovery
    case saved
    
    public var name: String {
        switch self {
        case .discovery: "Discover"
        case .saved: "Saved"
        }
    }
    
    private var unselectedIconName: String {
        switch self {
        case .discovery: "map"
        case .saved: "star"
        }
    }
    
    private var selectedIconName: String {
        switch self {
        case .discovery: "map.fill"
        case .saved: "star.fill"
        }
    }
    
    @ViewBuilder
    public func content(discoveryViewModel: DiscoveryViewModel) -> some View {
        switch self {
        case .discovery: DiscoveryView(viewModel: discoveryViewModel)
        case .saved: SavedMoviesView()
        }
    }
    
    public func iconName(withRoot rootScreen: NavigationScreen) -> String {
        rootScreen == self ? selectedIconName : unselectedIconName
    }
}
