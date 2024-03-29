//
//  CollectDict.swift
//  ParsingPipelines
//
//  Created by Rajveer Singh on 13/02/24.
//

import Foundation
import SwiftUI

// For combining multiple children views into single value
// visible to their parent views.
struct CollectDict<Key: Hashable, Value>: PreferenceKey {
    static var defaultValue: [Key : Value] { [:] }
    
    static func reduce(value: inout [Key : Value], nextValue: () -> [Key : Value]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
