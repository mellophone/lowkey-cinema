//
//  NavigationButtonView.swift
//  LowkeyCinema
//
//  Created by Ben Key on 2/27/26.
//

import SwiftUI

struct NavigationButtonView: View {
    @Binding var rootScreen: NavigationScreen
    let screen: NavigationScreen
    
    init(screen: NavigationScreen, withRoot rootScreen: Binding<NavigationScreen>) {
        self.screen = screen
        self._rootScreen = rootScreen
    }
    
    var body: some View {
        Button {
            rootScreen = screen
        } label: {
            HStack {
                Spacer()
                
                VStack {
                    Image(systemName: screen.iconName(withRoot: rootScreen))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 20)
                    Text(screen.name)
                        .font(.caption)
                }
                .foregroundStyle(Color.primary)
                
                Spacer()
            }
        }
    }
}

#Preview("Single", traits: .sizeThatFitsLayout) {
    NavigationButtonView(
        screen: .discovery,
        withRoot: .constant(.discovery)
    )
}

#Preview("Multiple", traits: .sizeThatFitsLayout) {
    HStack {
        NavigationButtonView(
            screen: .discovery,
            withRoot: .constant(.discovery)
        )

        NavigationButtonView(
            screen: .discovery,
            withRoot: .constant(.saved)
        )

        NavigationButtonView(
            screen: .saved,
            withRoot: .constant(.discovery)
        )
    }
}
