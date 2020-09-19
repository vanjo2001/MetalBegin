//
//  Mouse.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 15.09.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//


import MetalKit

enum MouseCodes: Int {
    case left = 0
    case right = 1
    case center = 2
}

class Mouse {
    private static var mouseButtonCount = 12
    private static var mouseButtonList = [Bool](repeating: false, count: mouseButtonCount)
    
    private static var overallMousePosition = SIMD2<Float>(0,0)
    private static var mousePositionDelta = SIMD2<Float>(0,0)
    
    private static var scrollWheelPosition: Float = 0
    private static var lastWheelPosition: Float = 0.0
    private static var scrollWheelChange: Float = 0.0
    
    public static func setMouseButtonPressed(button: Int, isOn: Bool) {
        mouseButtonList[button] = isOn
    }
    
    public static func isMouseButtonPressed(button: MouseCodes) -> Bool {
        return mouseButtonList[Int(button.rawValue)] == true
    }
    
    public static func setOverallMousePosition(position: SIMD2<Float>) {
        self.overallMousePosition = position
    }
    
    ///Sets the delta distance the mouse had moved
    public static func setMousePositionChange(overallPosition: SIMD2<Float>, deltaPosition: SIMD2<Float>) {
        self.overallMousePosition = overallPosition
        self.mousePositionDelta += deltaPosition
    }
    
    public static func scrollMouse(deltaY: Float) {
        scrollWheelPosition += deltaY
        scrollWheelChange += deltaY
    }
    
    //Returns the overall position of the mouse on the current window
    public static func getMouseWindowPosition() -> SIMD2<Float> {
        return overallMousePosition
    }
    
    ///Returns the movement of the wheel since last time getDWheel() was called
    public static func getDWheel() -> Float {
        let position = scrollWheelChange
        scrollWheelChange = 0
        return position
    }
    
    ///Movement on the y axis since last time getDY() was called.
    public static func getDY() -> Float {
        let result = mousePositionDelta.y
        mousePositionDelta.y = 0
        return result
    }
    
    ///Movement on the x axis since last time getDX() was called.
    public static func getDX() -> Float {
        let result = mousePositionDelta.x
        mousePositionDelta.x = 0
        return result
    }
    
    //Returns the mouse position in screen-view coordinates [-1, 1]
//    public static func GetMouseViewportPosition() -> SIMD2<Float> {
//        let x = (overallMousePosition.x - Renderer.ScreenSize.x * 0.5) / (Renderer.ScreenSize.x * 0.5)
//        let y = (overallMousePosition.y - Renderer.ScreenSize.y * 0.5) / (Renderer.ScreenSize.y * 0.5)
//        return SIMD2<Float>(x, y)
//    }
}
