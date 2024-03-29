//
//  WheelLayout.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 12/02/24.
//

import Foundation
import SwiftUI

// Wheel-like Layout structure for the tokenizer view.
struct WheelLayout: Layout {
    var radius: CGFloat
    var rotation: Angle
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxSize = subviews.map { $0.sizeThatFits(proposal) }.reduce(CGSize.zero) {
            return CGSize(width: max($0.width, $1.width),
                          height: max($0.height, $1.height))
        }
        
        return CGSize(width: (maxSize.width / 2 + radius) * 2,
                      height: (maxSize.height / 2 + radius) * 2)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let angleStep = Angle.degrees(360).radians / Double(subviews.count)
        
        for (index, subview) in subviews.enumerated() {
            let angle = angleStep * CGFloat(index) + rotation.radians
            
            var point = CGPoint(x: 0, y: -radius).applying(CGAffineTransform(rotationAngle: angle))
            
            point.x += bounds.midX
            point.y += bounds.midY
            
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}
