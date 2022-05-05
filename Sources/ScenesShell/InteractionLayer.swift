import Scenes
import Igis
import Foundation


  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {


    let board = Board(rect: Rect(size:Size(width:10, height:-10)))
    let background = Background()
    let wides = [50, 35, 10, -5, 10, 20, -10, 30, -10, 15, 20, -15]

 


      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          insert(entity: board, at: .front)
          insert(entity: background, at: .back)

          // We insert our RenderableEntities in the constructor

      }
      
      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
var x = 0         
          if key  == "x" {
              board.extend(height: 10)
          }

          if key == "f" {
              board.fall()
              
              Board.calculate(canvasSize: Size, canvas: Canvas, widthBetween: adds, widthOf: wides, n: x)
          x += 1}
      }

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        let canvasSize = canvas.canvasSize!
        let width = canvasSize.width
        let height = canvasSize.height
 
        var h = 0
        var v = 0
        board.move(to: Point(x:(adds[h] + wides[v]/2), y:300 + height/6 - 10))
        
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
      
  }
