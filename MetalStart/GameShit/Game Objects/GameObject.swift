
import MetalKit


class GameObject: Node {
    
    var modelConstants = ModelConstants()
    
    var mesh: Mesh!
    
    init(_ meshType: MeshType) {
        mesh = MeshLibrary.mesh(meshType)
    }
    
    var time: Float = 0.0
    
    func update(deltaTime: Float) {
        
        time += deltaTime
        
//        self.position.x = cos(time)
        self.scale = SIMD3<Float>(repeating: cos(time))
//        self.rotation.z = cos(time)
        
        updateModelConstants()
    }
    
    
    private func updateModelConstants() {
        modelConstants.modelMatrix = self.modelMatrix
    }
    
}



extension GameObject: Renderable {
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride(), index: 1)
        
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
    
}
