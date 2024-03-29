//
//  Line.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 13/02/24.
//

import Foundation
import SwiftUI

// Draw's animatable path between two points.
struct Line: Shape {
    var from: CGPoint
    var to: CGPoint
    
    var animatableData: AnimatablePair<CGPoint, CGPoint> {
        get { AnimatablePair(from, to) }
        set {
            from = newValue.first
            to = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: from)
            p.addLine(to: to)
        }
    }
}
