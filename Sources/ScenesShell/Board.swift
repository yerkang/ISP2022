import Igis
import Scenes
import Foundation

class Board: RenderableEntity, KeyDownHandler{
    
    var height = 0
    
    init(rect:Rect){       
        super.init(name: "Board")
    }
    
    func onUpKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if key == "ArrowUp" {
            
            height += 2 }
    }

    func onEnterKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if key == "j" {
            // insert function for board to fall
        }}

    override func render(canvas:Canvas) {
        
            let canvasSize = canvas.canvasSize!   
            let boardColor = StrokeStyle(color:Color(.black))
            let board = Path(fillMode: .stroke)
            // x value should be half of the building's width    
            board.moveTo(Point(x:10, y:(canvasSize.height/4)*3))
            board.lineTo(Point(x:10, y:((canvasSize.height/4)*3) + height))
            // y value should be canvasSize - buildingHeight + height increments
            let boardWidth = LineWidth(width: 5)
            canvas.render(boardColor, boardWidth, board)
    }


}
