//
//  ParseTreeViewModel.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 15/02/24.
//

import Foundation

// View model for the parse tree.
class ParseTreeViewModel: ObservableObject {
    @Published var binaryTree: ParseTree<Unique<String>> = uniqueTree
    
    func updateParseTree(with exprText: String) {
        binaryTree = binaryTree.rebuildTree(exprText)
    }
}
