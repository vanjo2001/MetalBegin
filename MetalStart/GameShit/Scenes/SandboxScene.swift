//
//  SandboxScene.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 13.09.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//


import MetalKit

class SandboxScene: Scene {
    
    
    override func buildScene() {
        for x in -5...5 {
            for y in -5...5 {
                let player = Player()
                player.position.x = (Float(x) + 0.5) / 5
                player.position.y = (Float(y) + 0.5) / 5
                
                player.scale = SIMD3<Float>(repeating: 0.1)
                addChild(player)
            }
        }
    }
    
    
    
}
