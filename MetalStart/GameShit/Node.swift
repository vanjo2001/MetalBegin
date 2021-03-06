//
//  Node.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 10.09.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//


import MetalKit

class Node {
    
    var position: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    var scale: SIMD3<Float> = SIMD3<Float>(repeating: 1)
    var rotation: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    
    var children: [Node] = []
    
    var modelMatrix: matrix_float4x4 {
        var model = matrix_identity_float4x4
        
        
        model.translation(direction: position)
        model.scale(axis: scale)
        
        model.rotate(angle: rotation.x, axis: x_axis)
        model.rotate(angle: rotation.y, axis: y_axis)
        model.rotate(angle: rotation.z, axis: z_axis)
        
        return model
    }
    
    func addChild(_ child: Node) {
        children.append(child)
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
    
    func update(deltaTime: Float) {
        for child in children {
            child.update(deltaTime: deltaTime)
        }
        
    }
    
}
