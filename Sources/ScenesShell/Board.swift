import Igis
import Scenes
import Foundation

class Board: RenderableEntity {
    var board: Rectangle 
    var height = 50
    
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
    }

    func extend(height: Int) {
        board.rect.size.height -= height }

    func fall() {
        let x =  board.rect.size.height
        board.rect.size.height = board.rect.size.width
        board.rect.size.width = x*(-1) }

    func calculate(canvas: Canvas, widthBetween: [Int], widthOf: [Int], n: Int) { // only called after f is held down
<<<<<<< HEAD
        let adds = [width/15, width/13, width/12, width/10, width/11, width/5, width/9, width/15, width/17] // distance between        
=======
        canvasSize = canvas.canvasSize!
        let width = canvasSize.width
        
>>>>>>> 7a44f83ee211ecc5041a3aa798c9ea3392258227
        if board.rect.size.width > (widthOf[n]/2) + widthBetween[n] + widthOf[n+1] { // n is index
            board.rect.size.width = 0
        }

        if board.rect.size.width < (widthOf[n]/2) + widthBetween[n] {
            board.rect.size.width = 0
            // dude never makes it - falls off
        }
        
        let startRange = (widthOf[n]/2) + widthBetween[n]
        let endRange = (widthOf[n]/2) + widthBetween[n] + widthOf[n+1]
        if endRange >= startRange {
        let numberRange = startRange...endRange
        }
        
        if numberRange.contains(board.rect.size.width) {
            board.rect.size.width += 40
            // dude walks over
        }

    }        
        
            
        


    

}
