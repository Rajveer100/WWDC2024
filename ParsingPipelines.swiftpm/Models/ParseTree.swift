//
//  ParseTree.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 12/02/24.
//

import Foundation

// A generic binary tree structure to represent a parse tree.
struct ParseTree<A> {
    var value: A
    var children: [ParseTree<A>] = []
    
    init(_ value: A, children: [ParseTree<A>] = []) {
        self.value = value
        self.children = children
    }
}

// Uniquely identify each node in the tree.
class Unique<A>: Identifiable {
    let value: A
    init(_ value: A) {
        self.value = value
    }
}

extension ParseTree {
    // Helper function to map values from type (A) -> (B)
    func map<B>(_ transform: (A) -> (B)) -> ParseTree<B> {
        ParseTree<B>(transform(value), children: children.map { $0.map(transform) })
    }
}

extension ParseTree {
    // Builds and updates the tree with valid changing expression values.
    mutating func rebuildTree(_ exprText: String) -> ParseTree<Unique<String>> {
        let expr = "(" + exprText + ")"
        
        guard isValidExpr(for: expr) else {
            print("Invalid!")
            return uniqueTree
        }
        
        var nodes = [ParseTree<String>]()
        var ch = [Character]()
        
        var root: ParseTree<String> = ParseTree<String>("?", children: [])
        
        // Converts Infix to Postfix expression while simultaneaously
        // updating the nodes in the tree.
        for c in expr {
            if c == "(" {
                ch.append(c)
            } else if c.isLetter {
                root = ParseTree<String>(String(c), children: [])
                nodes.append(root)
            } else if (OpPriority.priority[c] ?? -100) > 0 {
                // Checks (left->right) or (right->left) associativity for operators.
                while let last = ch.last, last != "(" &&
                        ((c != "^" && (OpPriority.priority[last] ?? -100) >= (OpPriority.priority[c] ?? -100)) ||
                        (c == "^" && (OpPriority.priority[last] ?? -100) > (OpPriority.priority[c] ?? -100))) {
                    updateNodes(with: &root, &nodes, &ch)
                }
                ch.append(c)
            } else if c == ")" {
                while let last = ch.last,
                        last != "(" {
                    updateNodes(with: &root, &nodes, &ch)
                }
                // Pop ending ")" in expression.
                let _ = ch.popLast()
            }
        }
        
        // If the operator list is still not empty the expression
        // was invalid during the postfix conversion.
        if !ch.isEmpty {
            print("Invalid!")
            return uniqueTree
        }
        
        let uniqueTree: ParseTree<Unique<String>> = root.map(Unique.init)
        return uniqueTree
    }
    
    // Updates root node with its children nodes.
    func updateNodes(with root: inout ParseTree<String>,
                     _ nodes: inout [ParseTree<String>], _ ch: inout [Character]) {
        if let last = ch.popLast(),
           let node1 = nodes.popLast(),
           let node2 = nodes.popLast() {
            root = ParseTree<String>(String(last), children: [])
            
            root.children.append(node2)
            root.children.append(node1)
            
            nodes.append(root)
        }
    }
}

extension ParseTree {
    func isValidExpr(for expr: String) -> Bool {
        // Check if the expression has any numbers.
        if expr.contains(try! Regex(".*[0-9]+.*")) {
            return false
        }
        
        // The expression must be a regular bracket sequence (RBS)
        // to have a matching ")" for every "(".
        var open: Int = 0
        for c in expr {
            if c == "(" {
                open += 1
            } else if c == ")" {
                open -= 1
                if open < 0 {
                    return false
                }
            }
        }
        
        return open == 0
    }
}

// Operator precedence values.
struct OpPriority {
    static let priority: [Character: Int] = [
        "+": 1,
        "-": 1,
        "*": 2,
        "/": 2,
        "^": 3,
        ")": 0
    ]
}

// Default dummy binary tree.
let binaryTree = ParseTree<String>("?", children: [])
let uniqueTree: ParseTree<Unique<String>> = binaryTree.map(Unique.init)
