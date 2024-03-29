//
//  HomeView.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 13/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var buttonIsAnimating = false
    
    var body: some View {
        NavigationStack {
            Text("Parsing Pipelines")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            Image(systemName: "bird.fill")
                .resizable()
                .aspectRatio(0.7, contentMode: .fit)
                .frame(width: 350, height: 350)
                .scaleEffect(isAnimating ? 1.5 : 1.0)
                .fontWeight(.ultraLight)
                .foregroundStyle(.orange)
                .clipShape(Circle())
                .onAppear {
                    if #available(iOS 17.0, *) {
                        withAnimation(.easeIn(duration: 1.5)) {
                            isAnimating.toggle()
                        } completion: {
                            withAnimation(.easeOut(duration: 2.5)) {
                                isAnimating = false
                            }
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }
            Spacer()
            TabView {
                ParagraphTextView(text: "Want to know more about programming languages and its compilation?!! 🤔💭")
                ParagraphTextView(text: "Let's do this step by step!")
            }
            .tabViewStyle(.page)
            .frame(minHeight: 250)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            NavigationLinkView(destinationView: TokenizerView(), isRestart: false)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
