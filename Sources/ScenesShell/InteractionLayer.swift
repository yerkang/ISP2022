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
    var Buildindex = 0


      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          insert(entity: board, at: .front)
          insert(entity: background, at: .back)

          // We insert our RenderableEntities in the constructor

      }
            

      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
          let wides = [80, 50, 90, 170, 290, 50, 170, 100] //building width
          let inBetween = [130, 170, 120, 140, 110, 90, 80] //area in between the buiildings

          if key  == "x" { //when key 'x' is pressed 
              board.extend(height: 50) // board extends up
              }

          if key == "f" {
              board.fall() //board width and height switches 'falls'
              board.calculate(widthBetween:inBetween, widthOf: wides, n: Buildindex) //whether it meets the buildings or not 
              Buildindex += 1 //increase the index so it matches building inbetween & width
          }              
          
      }

    override func preSetup(canvasSize: Size, canvas: Canvas) { 
        dispatcher.registerKeyDownHandler(handler: self)
        board.move(to: Point(x: 80 + (50/2), y:((canvasSize.height/6)*5 - 300 - 10))) // building height is 300, grass is 5/6 of canvas height
        // x value = 80 (initial x location) + (50 (initial building width) / 2)
        
    }
    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
      
    
    
}
