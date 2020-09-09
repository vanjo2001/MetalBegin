
import MetalKit


enum VertexShaderType {
    case basic
}

enum FragmentShaderType {
    case basic
}


class ShaderLibrary {
    
    public static var shaderLibrary: MTLLibrary!
    
    private static var vertexShaders: [VertexShaderType: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderType: Shader] = [:]
    
    public static func initialize() {
        shaderLibrary = Engine.device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders() {
        vertexShaders.updateValue(BasicVertexShader(), forKey: .basic)
        fragmentShaders.updateValue(BasicFragmentShader(), forKey: .basic)
    }
    
    public static func Vertex(_ vertexShaderType: VertexShaderType) -> MTLFunction {
        return vertexShaders[vertexShaderType]!.function
    }
    
    public static func Fragment(_ fragmentShaderType: FragmentShaderType) -> MTLFunction {
        return fragmentShaders[fragmentShaderType]!.function
    }
    
}


protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction { get }
}

public struct BasicVertexShader: Shader {
    
    var name: String = "Basic Vertex Shader"
    
    var functionName: String = "basic_vertex_shader"
    
    var function: MTLFunction {
        let function = ShaderLibrary.shaderLibrary.makeFunction(name: functionName)!
        function.label = name
        return function
    }
    
}

public struct BasicFragmentShader: Shader {
    
    var name: String = "Basic Fragment Shader"
    
    var functionName: String = "basic_fragment_shader"
    
    var function: MTLFunction {
        let function = ShaderLibrary.shaderLibrary.makeFunction(name: functionName)!
        function.label = name
        return function
    }
    
}
