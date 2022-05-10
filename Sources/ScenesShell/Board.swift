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
        minion = Image(sourceURL: minionURL)

        board = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name: "Board")

    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(minion)
    }

    override func render(canvas:Canvas) {
        let canvasSize = canvas.canvasSize!
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:1)

        canvas.render(strokeStyle, fillStyle, lineWidth, board)
        if  minion.isReady {
            let sourceRect = Rect(topLeft: Point(x: 00, y: 00), size: Size(width: 500, height: 500))
            let destinationRect = Rect(topLeft: Point(x:board.rect.topLeft.x - 50, y: (6*(canvasSize.height/7))-393), size: Size(width:100, height:100))
            minion.renderMode = .sourceAndDestination(sourceRect: sourceRect, destinationRect: destinationRect)
            canvas.render(minion)
            }
        }
    
    func move(to point:Point) { //board moves to point
        board.rect.topLeft = point
    } // initial point of rect

    func extend(height: Int) { //board becomes longer
        board.rect.size.height -= height } // func called in interaction to increase board height

    func fall() { //board falls (switch the height and width)
        let x =  board.rect.size.height
        board.rect.size.height = board.rect.size.width
        board.rect.size.width = x*(-1) }

    var ind = 0
    
    func calculate(widthBetween: [Int], widthOf: [Int]) -> Bool { // only called after f is held down        
        
           let endRange = (widthOf[ind]/2) + widthBetween[ind] + widthOf[ind+1]
           let startRange = (widthOf[ind]/2) + widthBetween[ind]
           let newPosition = (widthOf[ind]/2) + widthBetween[ind] + (widthOf[ind+1]/2)
           var tf = true
           
           if board.rect.size.width  > endRange { // ind is inden
               board.rect.size.height = 10
               board.rect.size.width = 10
               tf = false
               
           }
           if board.rect.size.width <  startRange  {
               board.rect.size.height = 10
               board.rect.size.width = 10
               tf = false
           }

           if board.rect.size.width <= endRange && board.rect.size.width >= startRange  {
               board.rect.topLeft.x += newPosition
               board.rect.size.width = 10
               board.rect.size.height = -10
               ind += 1
               // dude walks over
           }

           return tf
       }
}
//checks if board is long enough to walk on. 
