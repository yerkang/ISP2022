import Igis
import Scenes
import Foundation

<<<<<<< HEAD
class Board: RenderableEntity, KeyDownHandler{
=======
class Board: RenderableEntity {
    var board: Rectangle 
    var height = 50
>>>>>>> d9981a4738eff58943e34f3f707b385cbcb487f9
    
    init(rect: Rect){
        board = Rectangle(rect:rect, fillMode:.fillAndStroke)  
        super.init(name: "Board")
    }
    

    
    override func render(canvas:Canvas) {
<<<<<<< HEAD
        
            let canvasSize = canvas.canvasSize!   
            let boardColor = StrokeStyle(color:Color(.black))
            let board = Path(fillMode: .stroke)
            // x value should be half of the building's width    
            board.moveTo(Point(x:10, y:(canvasSize.height/4)*3))
            board.lineTo(Point(x:10, y:((canvasSize.height/4)*3) + height))
            // y value should be canvasSize - buildingHeight + height increments
            let boardWidth = LineWidth(width: 5)
            canvas.render(boardColor, boardWidth, board)
=======
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        canvas.render(strokeStyle, fillStyle, lineWidth, board)
>>>>>>> d9981a4738eff58943e34f3f707b385cbcb487f9
    }

    func move(to point:Point) {
        board.rect.topLeft = point
    }

}
