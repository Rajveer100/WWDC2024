//
//  ParagraphTextView.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 12/02/24.
//

import SwiftUI

struct ParagraphTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .padding()
            .fontWeight(.light)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2.0)
                    .foregroundStyle(.yellow)
            }
            .clipped()
            .padding()
    }
}

#Preview {
    ParagraphTextView(text: "Paragraph Text...")
}
