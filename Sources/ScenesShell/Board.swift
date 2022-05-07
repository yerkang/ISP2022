import Igis
import Scenes
import Foundation

class Board: RenderableEntity {
    var board: Rectangle 
    var height = 5
    
    init(rect: Rect){
        board = Rectangle(rect:rect, fillMode:.fillAndStroke)  
        super.init(name: "Board")
    }
    
    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        canvas.render(strokeStyle, fillStyle, lineWidth, board)

    }

    func move(to point:Point) {
        board.rect.topLeft = point
    } // initial point of rect

    func extend(height: Int) {
        board.rect.size.height -= height } // func called in interaction to increase board height

    func fall() {
        let x =  board.rect.size.height
        board.rect.size.height = board.rect.size.width
        board.rect.size.width = x*(-1) }

  //  func gameOver() {
  //  }
    
    func calculate(widthBetween: [Int], widthOf: [Int], n: Int) { // only called after f is held down
       
        
       
        if board.rect.size.width > (widthOf[n]/2) + widthBetween[n] + widthOf[n+1] { // n is index
            board.rect.size.height = 100   

        }

        if board.rect.size.width < (widthOf[n]/2) + widthBetween[n] + 10  {
    

            board.rect.size.height = 50
            // dude never makes it - falls off
        }

        let startRange = (widthOf[n]/2) + widthBetween[n]
        let endRange = (widthOf[n]/2) + widthBetween[n] + widthOf[n+1]
          

        if board.rect.size.width > startRange && board.rect.size.width < endRange  {

            board.rect.size.height = 0
            // dude walks over
        }

    
    }
    

} // board falling graphic - called in interaction
