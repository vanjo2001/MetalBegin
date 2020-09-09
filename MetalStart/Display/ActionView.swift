//
//  ActionView.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 29.08.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import MetalKit
import simd

class ActionView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        device = MTLCreateSystemDefaultDevice()
        
        Engine.Inite(device: device!)
        
        clearColor = Preferences.clearColor
        
        colorPixelFormat = Preferences.mainPixelFormat
        
        renderer = Renderer()
        
        delegate = renderer
        
    }

}
