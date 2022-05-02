import Scenes
import Igis
<<<<<<< HEAD

=======
import Foundation 
>>>>>>> d9981a4738eff58943e34f3f707b385cbcb487f9
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {
<<<<<<< HEAD

=======
    let board = Board(rect:Rect(size:Size(width:10, height:100)))
    let background = Background()
    var height = 0
>>>>>>> d9981a4738eff58943e34f3f707b385cbcb487f9
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          insert(entity: board, at: .front)
          insert(entity: background, at: .back)

          // We insert our RenderableEntities in the constructor
          insert(entity: Board, at: .front)
      }
      override func presetup(canvasSize:size, canvas:Canvas){
          dispatcher.registerKeyDownHandler(handler: self)
      }
      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
      }

      
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if code  == "KeyX" {
            height += 50
        }}

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        board.move(to: Point(x:10, y:((canvasSize.height/3)*2) + height))
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }




      
  }
