
import MetalKit


class GameObject: Node {
    
    var modelConstants = ModelConstants()
    
    var mesh: Mesh!
    
    init(_ meshType: MeshType) {
        mesh = MeshLibrary.mesh(meshType)
    }
    
    override func update(deltaTime: Float) {
        
        if (Keyboard.isKeyPressed(.rightArrow)) {
            position.x += deltaTime
        }
        if (Keyboard.isKeyPressed(.leftArrow)) {
            position.x -= deltaTime
        }
        if (Keyboard.isKeyPressed(.upArrow)) {
            position.y += deltaTime
        }
        if (Keyboard.isKeyPressed(.downArrow)) {
            position.y -= deltaTime
        }
        
        
        rotation.z += 0.02
        
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
