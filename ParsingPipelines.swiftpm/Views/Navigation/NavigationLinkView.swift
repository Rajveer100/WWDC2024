//
//  NavigationLinkView.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 13/02/24.
//

import SwiftUI

struct NavigationLinkView<V: View>: View {
    let destinationView: V
    let isRestart: Bool
    
    var body: some View {
        NavigationLink {
            destinationView
        } label: {
            Image(systemName: !isRestart ? "arrow.right.circle" : "arrowshape.turn.up.backward.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
                .foregroundStyle(.foreground)
        }
    }
}

#Preview {
    NavigationLinkView(destinationView: HomeView(), isRestart: false)
}
