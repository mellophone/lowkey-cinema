//
//  NavigationBarView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/27/26.
//

import SwiftUI

struct NavigationBarView: View {
    @Binding var rootScreen: NavigationScreen
    
    init(withRoot rootScreen: Binding<NavigationScreen>) {
        self._rootScreen = rootScreen
    }
    
    var body: some View {
        HStack {
            NavigationButtonView(screen: .discovery, withRoot: $rootScreen)
            NavigationButtonView(screen: .saved, withRoot: $rootScreen)
        }
    }
}

#Preview {
    VStack {
        Spacer()
        NavigationBarView(withRoot: .constant(.discovery))
    }
}
