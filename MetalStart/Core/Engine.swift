
import MetalKit


class Engine {
    
    public static var device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func Inite(device: MTLDevice) {
        self.device = device
        commandQueue = self.device.makeCommandQueue()
        
        ShaderLibrary.initialize()
        VertexDescriptorLibrary.initialize()
        RenderPipelineDescriptorLibrary.initialize()
        RenderPipelineStateLibrary.initialize()
    }
    
}
