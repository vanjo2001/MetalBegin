
import MetalKit


enum RenderPipelineStateType {
    case basic
}


class RenderPipelineStateLibrary {
    
    private static var renderPipelineStates: [RenderPipelineStateType: RenderPipelineState] = [:]
    
    private static func createDefaultRenderPipelineStates() {
        renderPipelineStates.updateValue(BasicRenderPipelineState(), forKey: .basic)
    }
    
    public static func initialize() {
        createDefaultRenderPipelineStates()
    }
    
    public static func pipelineState(_ renderPipelineStateType: RenderPipelineStateType) -> MTLRenderPipelineState {
        return renderPipelineStates[renderPipelineStateType]!.renderPipelineState
    }
    
}


protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState! { get }
}

class BasicRenderPipelineState: RenderPipelineState {
    
    var name: String = "Render Pipeline State"
    
    var renderPipelineState: MTLRenderPipelineState!
    
    init() {
        
        do {
            renderPipelineState = try Engine.device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.basic))
        } catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(name)__::\(error)")
        }
        
    }
    
    
}
