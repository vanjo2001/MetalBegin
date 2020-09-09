
import MetalKit


enum RenderPipelineDescriptorType {
    case basic
}

class RenderPipelineDescriptorLibrary {
    
    private static var renderPipelineDescriptors: [RenderPipelineDescriptorType: RenderPipelineDescriptor] = [:]
    
    
    public static func initialize() {
        createDefaultRenderPipelineDescriptor()
    }
    
    private static func createDefaultRenderPipelineDescriptor() {
        renderPipelineDescriptors.updateValue(BasicRenderPipelineDescriptor(), forKey: .basic)
    }
    
    public static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorType) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
    
}


protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

class BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    
    var name: String = "Basic Render Pipeline Descriptor"
    
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        let renderPipeLineDesc = MTLRenderPipelineDescriptor()
        
        renderPipeLineDesc.colorAttachments[0].pixelFormat = Preferences.mainPixelFormat
        renderPipeLineDesc.vertexFunction = ShaderLibrary.Vertex(.basic)
        renderPipeLineDesc.fragmentFunction = ShaderLibrary.Fragment(.basic)
        renderPipeLineDesc.vertexDescriptor = VertexDescriptorLibrary.descriptor(.basic)
        
        return renderPipeLineDesc
    }
    
}
