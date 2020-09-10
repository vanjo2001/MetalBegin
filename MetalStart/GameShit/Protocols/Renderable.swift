//
//  Renderable.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 10.09.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//


import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
