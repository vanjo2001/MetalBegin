//
//  ActionView.swift
//  MetalStart
//
//  Created by IvanLyuhtikov on 29.08.20.
//  Copyright © 2020 IvanLyuhtikov. All rights reserved.
//

import MetalKit

class ActionView: MTKView {
    
    var commandQueue: MTLCommandQueue!
    var renderPipelineState: MTLRenderPipelineState!
    
    
    var vertices: [Vertex] = [
                                Vertex(position: SIMD3<Float>(0, 1, 0), color: SIMD4<Float>(1, 0, 0, 1)),
                                Vertex(position: SIMD3<Float>(-1, -1, 0), color: SIMD4<Float>(0, 1, 0, 1)),
                                Vertex(position: SIMD3<Float>(1, -1, 0), color: SIMD4<Float>(0, 0, 1, 1))
                                ]
    
    var vertexBuffer: MTLBuffer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        device = MTLCreateSystemDefaultDevice()
        
        clearColor = MTLClearColorMake(0.2, 0.3, 0.7, 1.0)
        
        colorPixelFormat = .bgra8Unorm
        
        commandQueue = device?.makeCommandQueue()
        
        createRenderPipelineState()
        
        createBuffer()
    }
    
    func createBuffer() {
        vertexBuffer = device?.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
    
    func createRenderPipelineState() {
        let library = device?.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
        let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
        
        let vertexDescriptor = MTLVertexDescriptor()
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = SIMD3<Float>.size()
        
        vertexDescriptor.layouts[0].stride = Vertex.stride()
        
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = colorPixelFormat
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        renderPipelineDescriptor.vertexDescriptor = vertexDescriptor
        
        do {
            renderPipelineState = try device?.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
        } catch let error {
            print(error)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
        
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: vertices.count)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    

}
