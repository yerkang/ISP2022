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

 




 
    let board = Board(rect:Rect(size:Size(width:10, height:100)))
    let background = Background()
    var height = 0




    let board = Board(rect: Rect(size:Size(width:10, height:10)))


    let board = Board(rect: Rect(size:Size(width:10, height:-10)))

    let background = Background()
    let wides = [50, 35, 10, 5, 10, 20, 10, 30, 10, 15, 20, 15]
    let adds = [130, 170, 120, 140, 110, 90, 150, 160, 175, 80, 130, 170]

 



 
    let board = Board(rect:Rect(size:Size(width:10, height:100)))
    let background = Background()
    var height = 0


      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          insert(entity: board, at: .front)
          insert(entity: background, at: .back)

          // We insert our RenderableEntities in the constructor

      }
      



      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {

          let wides = [80, 50, 90, 170, 290, 50, 170, 140, 240, 170, 250, 50, 170] // tower width increment
          let inBetween = [130, 170, 120, 140, 110, 90, 150, 160, 175, 80]     


          if key  == "x" {
              board.extend(height: 50)
              }

          if key == "f" {
              board.fall()
              board.calculate(widthBetween:inBetween, widthOf: wides, n: 0)}
          
      }

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        board.move(to: Point(x: 80 + (50/2), y:((canvasSize.height/6)*5 - 300 - 10))) // building height is 300, grass is 5/6 of canvas height
        // x value = 80 (initial x location) + (50 (initial building width) / 2)


var x = 0         



          if key  == "x" {
              board.extend(height: 10)
          }

          if key == "f" {
              board.fall()
              

              board.calculate(canvasSize: Size, canvas: Canvas, widthBetween: adds, widthOf: wides, n: x)
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



    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if code  == "KeyX" {
            height += 50
        }}

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        board.move(to: Point(x:10, y:((canvasSize.height/3)*2) + height))


    }
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if code  == "KeyX" {
            height += 50
        }}
    

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        dispatcher.registerKeyDownHandler(handler: self)
        board.move(to: Point(x:10, y:((canvasSize.height/3)*2) + height))


              board.calculate( widthBetween: adds, widthOf: wides, n: x)
              x = (x+1)%11}
    

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
