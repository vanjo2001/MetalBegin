
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
    var vertexDescriptor: MTLVertexDescriptor { get }
}


public class BasicVertexDescriptor: VertexDescriptor {
    
    var name: String = "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor {
        let vertexDesc = MTLVertexDescriptor()
        
        //Position
        vertexDesc.attributes[0].format = .float3
        vertexDesc.attributes[0].bufferIndex = 0
        vertexDesc.attributes[0].offset = 0
        
        //Color
        vertexDesc.attributes[1].format = .float4
        vertexDesc.attributes[1].bufferIndex = 0
        vertexDesc.attributes[1].offset = SIMD3<Float>.size()
        
        vertexDesc.layouts[0].stride = Vertex.stride()
        
        return vertexDesc
    }
    
    
}
