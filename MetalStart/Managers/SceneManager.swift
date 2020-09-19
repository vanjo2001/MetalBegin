//
//  SceneManager.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 13.09.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//


import MetalKit


enum SceneType {
    case sandbox
}

class SceneManager {
    
    private static var currentScene: Scene!
    
    public static func initialize(_ sceneType: SceneType) {
        setScene(sceneType)
    }
    
    private static func setScene(_ sceneType: SceneType) {
        switch sceneType {
        case .sandbox:
            currentScene = SandboxScene()
        }
    }
    
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        currentScene.update(deltaTime: deltaTime)
        currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
