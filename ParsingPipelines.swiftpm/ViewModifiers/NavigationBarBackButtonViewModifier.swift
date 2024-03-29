//
//  NavigationBarBackButtonViewModifier.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 13/02/24.
//

import SwiftUI

struct NavigationBarBackButtonViewModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundStyle(.foreground)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}
