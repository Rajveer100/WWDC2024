//
//  SummaryView.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 16/02/24.
//

import SwiftUI
import ConfettiSwiftUI

struct SummaryView: View {
    @State var actionImageName: String = "figure.boxing"
    @State var counter: Int = 0
    
    var body: some View {
        NavigationStack {
            Text("Nice! Hope You Had Fun!")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Text("😸")
                .font(.largeTitle)
                .padding()
            Spacer()
            VStack {
                Button {
                    if actionImageName == "figure.boxing" {
                        counter += 1
                    }
                    withAnimation(.spring(duration: 0.5)) {
                        actionImageName = (actionImageName == "figure.boxing" ? "figure.kickboxing" : "figure.boxing")
                    }
                } label: {
                    Image(systemName: actionImageName)
                        .resizable()
                        .aspectRatio(0.7, contentMode: .fit)
                        .frame(maxWidth: 150, maxHeight: 150)
                        .foregroundStyle(.orange)
                        .padding()
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(.orange)
                        }
                }
                .padding()
                .confettiCannon(counter: $counter)
                Image(systemName: "arrow.up")
            }
            Spacer()
            Text("Bonus Tip: Try building your own programming language from scratch!")
                .font(.largeTitle)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(lineWidth: 1.0)
                }
            
            NavigationLinkView(destinationView: HomeView(), isRestart: true)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SummaryView()
}
