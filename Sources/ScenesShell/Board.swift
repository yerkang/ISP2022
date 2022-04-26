import Igis
import Scenes

class Board: RenderableEntity {
    var rectangle : Rectangle
    var height = 0
    
    init(rect:Rect){       
        super.init(name: "Board")
    }
    
    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if key == "ArrowUp" {
            height += 2 }
    }

    override func render(canvas:Canvas) {
        
            let canvasSize = canvas.canvasSize!   
            let boardColor = FillStyle(color:Color(.black))
            let board = Path()
            // x value should be half of the building's width    
            board.moveTo(Point(x:10, y:(canvasSize.height/3)*2))
            board.lineTo(Point(x:10, y:((canvasSize.height/3)*2) + height))
            // y value should be canvasSize - buildingHeight + height increments
            let boardWidth = LineWidth(width: 5)
            canvas.render(boardColor, boardWidth, board)
    }


}
