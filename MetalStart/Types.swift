//
//  Types.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 31.08.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import simd


protocol sizeable {
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}

extension sizeable {
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
}

extension SIMD3: sizeable {}

struct Vertex: sizeable {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}
