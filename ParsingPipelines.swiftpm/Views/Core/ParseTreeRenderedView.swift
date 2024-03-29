//
//  ParseTreeRenderedView.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 12/02/24.
//

import SwiftUI

struct ParseTreeRenderedView: View {
    @EnvironmentObject var treeModel: ParseTreeViewModel
    @State var text: String = ""
    
    var body: some View {
        NavigationStack {
            Text("Parser and AST")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            ScrollView([.horizontal, .vertical]) {
                ParseTreeView(tree: treeModel.binaryTree) { value in
                    Text("\(value.value)")
                        .frame(width: 50, height: 50)
                        .background(Circle().stroke())
                        .background(Circle().fill(.orange))
                        .padding(10)
                }
            }
            Spacer()
            TextField("Enter any expression", text: $text)
                .frame(minHeight: 50)
                .multilineTextAlignment(.center)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .overlay {
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(lineWidth: 0.6)
                }
                .padding()
            Button(action: {
                treeModel.updateParseTree(with: text)
            }, label: {
                Image(systemName: "wand.and.stars")
                    .foregroundStyle(.foreground)
                    .font(.largeTitle)
            })
            TabView {
                ParagraphTextView(text: "Expressions are then parsed in the form of an Abstract Syntax Tree.")
                ParagraphTextView(text: "Try entering any expression above! (ex: (x + y) * z)")
            }
            .tabViewStyle(.page)
            .frame(minHeight: 250)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            NavigationLinkView(destinationView: IRCodeGen(), isRestart: false)
        }
        .modifier(NavigationBarBackButtonViewModifier())
    }
}

#Preview {
    ParseTreeRenderedView()
        .environmentObject(ParseTreeViewModel())
}
