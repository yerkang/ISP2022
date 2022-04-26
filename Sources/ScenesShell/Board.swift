import Igis
import Scenes

class Board: RenderableEntity {
    var rectangle : Rectangle

    init(rect:Rect){
        let canvasSize = canvasSize.size
        // x value should be half of the building's width 
        var BoardRect = Rect(topLeft: Point(x: 25, y: (canvasSize/3)*2))
          rectangle = Rectangle(BoardRect:rect, fillMode:.fillAndStroke)
        super.init(name: "Board")
    }

    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if key == "ArrowUp" {
            BoardRect.size.height += 2 }
    }

}
