
import MetalKit


class GameObject: Node {
    
    var mesh: Mesh!
    
    init(_ meshType: MeshType) {
        mesh = MeshLibrary.mesh(meshType)
    }
    
}



extension GameObject: Renderable {
    
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
    
}
