//
//  TokenizerView.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 12/02/24.
//

import SwiftUI

struct TokenizerView: View {
    @State private var angle: Angle = .zero
    private let tokenText: [String] = ["var", "let", "if", "for", "do", "+", "-", "=="]
    
    var body: some View {
        NavigationStack {
            Text("Tokenizer")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            WheelLayout(radius: 130.0, rotation: angle) {
                ForEach(0..<8) { idx in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.orange)
                        .frame(width: 70, height: 70)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 0.5)
                                .foregroundStyle(.foreground)
                        }
                        .overlay {
                            Text("\(tokenText[idx])")
                        }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 2.0)) {
                    angle = (angle == .zero ? .degrees(90) : .zero)
                }
            }
            Spacer()
            ParagraphTextView(text: "Lexical Analysis is responsible for dividing input stream into tokens.")
            
            NavigationLinkView(destinationView: ParseTreeRenderedView(), isRestart: false)
        }
        .modifier(NavigationBarBackButtonViewModifier())
    }
}

#Preview {
    TokenizerView()
}
