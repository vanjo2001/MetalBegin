
import MetalKit

enum MeshType {
    case triangleCustomMesh
    case quadCustomMesh
}

class MeshLibrary {
    
    private static var meshes: [MeshType: Mesh] = [:]
    
    public static func initialize() {
        createDefaultMeshes()
    }
    
    public static func createDefaultMeshes() {
        meshes.updateValue(TriangleCustomMesh(), forKey: .triangleCustomMesh)
        meshes.updateValue(QuadCustomMesh(), forKey: .quadCustomMesh)
    }
    
    public static func mesh(_ meshType: MeshType) -> Mesh {
        return meshes[meshType]!
    }
}


protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}


class CustomMesh: Mesh {
    
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    
    init() {
        createVertices()
        createBuffer()
    }
    
    func createVertices() {
     }
    
    func createBuffer() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
    
    
}

class TriangleCustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
                    Vertex(position: SIMD3<Float>(0, 1, 0), color: SIMD4<Float>(1, 0, 0, 1)),
                    Vertex(position: SIMD3<Float>(-1, -1, 0), color: SIMD4<Float>(0, 1, 0, 1)),
                    Vertex(position: SIMD3<Float>(1, -1, 0), color: SIMD4<Float>(0, 0, 1, 1))
                    ]
    }
}

class QuadCustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
                    Vertex(position: SIMD3<Float>(1.0, 1.0, 0), color: SIMD4<Float>(1, 0, 0, 1)),       //Top Right
                    Vertex(position: SIMD3<Float>(-1.0, 1.0, 0), color: SIMD4<Float>(0, 1, 0, 1)),      //Top Left
                    Vertex(position: SIMD3<Float>(-1.0, -1.0, 0), color: SIMD4<Float>(0, 0, 1, 1)),     //Bottom Left
                    
                    Vertex(position: SIMD3<Float>(1.0, 1.0, 0), color: SIMD4<Float>(1, 0, 0, 1)),       //Top Right
                    Vertex(position: SIMD3<Float>(-1.0, -1.0, 0), color: SIMD4<Float>(0, 0, 1, 1)),     //Bottom Left
                    Vertex(position: SIMD3<Float>(1.0, -1.0, 0), color: SIMD4<Float>(1, 0, 1, 1)),      //Bottom Right
                    ]
    }
}
