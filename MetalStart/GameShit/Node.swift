//
//  Node.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 10.09.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//


import MetalKit

class Node {
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
    
}
