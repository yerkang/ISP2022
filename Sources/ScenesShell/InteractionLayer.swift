import Scenes
import Igis

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {

      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
          insert(entity: Board, at: .front)
      }
      override func presetup(canvasSize:size, canvas:Canvas){
          dispatcher.registerKeyDownHandler(handler: self)
      }
      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
      }
  }
