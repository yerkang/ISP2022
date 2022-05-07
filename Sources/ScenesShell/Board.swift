import Igis
import Scenes
import Foundation

class Board: RenderableEntity {
    var board: Rectangle 
    var height = 5
    let minion : Image

    init(rect: Rect){
        guard let minionURL = URL(string: "https://lh3.googleusercontent.com/88F7Rb9P6LuwRSybaHEYZvnPuRcwwNF-g1bRCta4WaFHr9vkqlfO_PjJYkzjCJKanXmupFtAOjbFDe8s_P7bMwqyZBhPMaZt0b2aYg=w600")
        else {
            fatalError("Failed to create URL for minion")
        }
        minion = Image(sourceURL: minionURL)

        board = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name: "Board")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(minion)
    }

    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:1)
        canvas.render(strokeStyle, fillStyle, lineWidth, board)
        if minion.isReady {
            let sourceRect = Rect(topLeft: Point(x: 00, y: 00), size: Size(width: 500, height: 500))
            let destinationRect = Rect(topLeft: Point(x:-(board.rect.height - board.rect.width) - 10 , y:265), size: Size(width:100, height:100))
            minion.renderMode = .sourceAndDestination(sourceRect: sourceRect, destinationRect: destinationRect)
            canvas.render(minion)
        }

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
        var x = n
        if board.rect.size.width  > (widthOf[x+1]/2) + widthBetween[x] + widthOf[x+2] { // n is index
            board.rect.size.height = 100
            
        }

        if board.rect.size.width <  (widthOf[x+1]/2) + widthBetween[x] {
            board.rect.size.height = 50
        }
        
        let endRange = (widthOf[x+1]/2) + widthBetween[x] + widthOf[x+2]
        let startRange = (widthOf[x+1]/2) + widthBetween[x]
        let newPosition = (widthOf[x+1]/2) + widthBetween[x] + (widthOf[x+2]/2)
        
        if board.rect.size.width < endRange && board.rect.size.width > startRange  {
            board.rect.topLeft.x += newPosition
            board.rect.size.width = 10
            board.rect.size.height = -10
            

            x += 1
            // dude walks over
        }
       }
}
 //board falling graphic - called in interaction 
