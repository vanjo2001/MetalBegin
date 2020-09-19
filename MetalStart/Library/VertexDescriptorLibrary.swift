
import MetalKit


enum VertexDescriptorType {
    case basic
}

class VertexDescriptorLibrary {
    
    private static var vertexDescriptor: [VertexDescriptorType: BasicVertexDescriptor] = [:]
    
    public static func initialize() {
        createDefaultDescriptors()
    }
    
    private static func createDefaultDescriptors() {
        vertexDescriptor.updateValue(BasicVertexDescriptor(), forKey: .basic)
    }
    
    public static func descriptor(_ vertexDescriptorType: VertexDescriptorType) -> MTLVertexDescriptor {
        return vertexDescriptor[.basic]!.vertexDescriptor
    }
    
}


protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}


public class BasicVertexDescriptor: VertexDescriptor {
    
    var name: String = "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        
        //Position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        //Color
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = SIMD3<Float>.size()
        
        vertexDescriptor.layouts[0].stride = Vertex.stride()
        
    }
    
    
}
