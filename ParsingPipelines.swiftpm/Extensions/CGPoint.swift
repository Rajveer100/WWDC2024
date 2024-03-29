//
//  CGPoint.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 13/02/24.
//

import Foundation
import SwiftUI

// Extension for CGPoint conforming to VectorArithmetic
// to use AnimatablePair<CGPoint, CGPoint> while projecting Line Path.
extension CGPoint: VectorArithmetic {
    
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    public static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    public mutating func scale(by rhs: Double) {
        x *= CGFloat(rhs)
        y *= CGFloat(rhs)
    }
    
    public var magnitudeSquared: Double {
        Double(x * x + y * y)
    }
}
