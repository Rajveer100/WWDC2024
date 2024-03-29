//
//  ParseTreeView.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 12/02/24.
//

import SwiftUI
import CoreGraphics

struct ParseTreeView<A: Identifiable, V: View>: View {
    let tree: ParseTree<A>
    let node: (A) -> V
    
    typealias Key = CollectDict<A.ID, Anchor<CGPoint>>
    
    var body: some View {
        VStack {
            node(tree.value)
                .anchorPreference(key: Key.self, value: .center, transform: {
                    [tree.value.id: $0]
                })
            HStack(alignment: .bottom, spacing: 10) {
                ForEach(tree.children, id: \.value.id) { child in
                    ParseTreeView(tree: child, node: node)
                }
            }
        }
        .backgroundPreferenceValue(Key.self) { (centers: [A.ID: Anchor<CGPoint>]) in
            GeometryReader { proxy in
                ForEach(tree.children, id: \.value.id) { child in
                    Line(
                        from: proxy[centers[tree.value.id]!],
                        to: proxy[centers[child.value.id]!]
                    )
                    .stroke()
                }
            }
        }
    }
}

//#Preview {
//    ParseTreeView(...)
//}
