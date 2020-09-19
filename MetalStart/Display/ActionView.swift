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

extension ActionView {
    
    override var acceptsFirstResponder: Bool { true }
     
     override func keyUp(with event: NSEvent) {
         Keyboard.setKeyPressed(event.keyCode, isOn: false)
     }
     
     override func keyDown(with event: NSEvent) {
         Keyboard.setKeyPressed(event.keyCode, isOn: true)
     }
}



//Mouse input
extension ActionView {
    
    //Informs the receiver that the user has pressed the left mouse button.
    override func mouseDown(with event: NSEvent) {
        Mouse.setMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    //Informs the receiver that the user has released the left mouse button.
    override func mouseUp(with event: NSEvent) {
        Mouse.setMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    //Informs the receiver that the user has pressed the right mouse button.
    override func rightMouseDown(with event: NSEvent) {
        Mouse.setMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    //Informs the receiver that the user has released the right mouse button.
    override func rightMouseUp(with event: NSEvent) {
        Mouse.setMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    //Informs the receiver that the user has pressed a mouse button other than the left or right one.
    override func otherMouseDown(with event: NSEvent) {
        Mouse.setMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    //Informs the receiver that the user has released a mouse button other than the left or right button.
    override func otherMouseUp(with event: NSEvent) {
        Mouse.setMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
}


//Mouse movement
extension ActionView {
    
    override func mouseMoved(with event: NSEvent) {
        
    }
    
    override func scrollWheel(with event: NSEvent) {
        
    }
    
    override func mouseDragged(with event: NSEvent) {
        
    }
    
    override func rightMouseDragged(with event: NSEvent) {
        
    }
    
    override func otherMouseDragged(with event: NSEvent) {
        
    }
    
    
    private func setMousePositionChanged(event: NSEvent) {
        let overallLocation = SIMD2<Float>(Float(event.locationInWindow.x),
                                           Float(event.locationInWindow.y))
        
        let deltaChange = SIMD2<Float>(Float(event.deltaX),
                                       Float(event.deltaY))
        
        Mouse.setMousePositionChange(overallPosition: overallLocation, deltaPosition: deltaChange)
    }
    
    override func updateTrackingAreas() {
        
    }
    
}
