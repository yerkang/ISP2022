import Scenes
import Igis
import Foundation


  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {


    let board = Board(rect: Rect(size:Size(width:10, height:10)))
    let background = Background()


      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          insert(entity: board, at: .front)
          insert(entity: background, at: .back)

          // We insert our RenderableEntities in the constructor

      }
      
      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
         
          if key  == "x" {
              board.extend(height: 50)
              }

          if key == "f" {
              board.fall()}
          
      }

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        board.move(to: Point(x:10, y:((canvasSize.height/6)*5 - 300 - 10))) // building height is 300, grass is 5/6 of canvas height
        
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
      
  }
