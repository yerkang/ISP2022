import Igis
import Scenes
import Foundation

class Board: RenderableEntity {
    var board: Rectangle 
    var height = 5
    let minion : Image

    let wides = [80, 50, 90, 170, 290, 50, 170, 100] //building width
    let inBetween = [130, 170, 120, 140, 110, 90, 80] //area in between the buiilding
    var x = 0 //index of array

    init(rect: Rect){
        guard let minionURL = URL(string: "https://lh3.googleusercontent.com/88F7Rb9P6LuwRSybaHEYZvnPuRcwwNF-g1bRCta4WaFHr9vkqlfO_PjJYkzjCJKanXmupFtAOjbFDe8s_P7bMwqyZBhPMaZt0b2aYg=w600")
        else {
            fatalError("Failed to create URL for minion")
        }
        guard let loseURL = URL(string:"http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/998c2fe51b48b9e.png")
        else {
            fatalError("Failed to create URL for lose")
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
        if  minion.isReady {
            let sourceRect = Rect(topLeft: Point(x: 00, y: 00), size: Size(width: 500, height: 500))
            let destinationRect = Rect(topLeft: Point(x:board.rect.topLeft.x + board.rect.size.width, y:265), size: Size(width:100, height:100))
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
   
           let endRange = (widthOf[n]/2) + widthBetween[n] + widthOf[n+1]
           let startRange = (widthOf[n]/2) + widthBetween[n]
           let newPosition = (widthOf[n]/2) + widthBetween[n] + (widthOf[n+1]/2)
           
           if board.rect.size.width  > endRange { // n is inden
               board.rect.size.height = 10
           }
           if board.rect.size.width <  startRange  {
               board.rect.size.height = 10
           }

           if board.rect.size.width < endRange && board.rect.size.width > startRange  {
               board.rect.topLeft.x += newPosition
               board.rect.size.width = 10
               board.rect.size.height = -10
               // dude walks over
           }
       }
}
 //board falling graphic - called in interaction 
