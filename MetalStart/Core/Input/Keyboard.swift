//
//  Keyboard.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 13.09.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import Foundation

class Keyboard {
    
    private static var keyCount: Int = 256
    private static var keys = [Bool](repeatElement(false, count: keyCount))
    
    public static func setKeyPressed(_ keyCode: UInt16, isOn: Bool) {
        keys[Int(keyCode)] = isOn
    }
    
    public static func isKeyPressed(_ keyCode: KeyCodes) -> Bool {
        keys[Int(keyCode.rawValue)]
    }
}
