import Igis
import Scenes

class Score: RenderableEntity {
    

    init(rect:Rect) {
    //    rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        super.init(name:"Score")
    }
    
    override func render(canvas:Canvas) {
        let scoreBoardRect = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
        let scoreBoard = Rectangle(rect: scoreBoardRect, fillMode: .fillAndStroke)
        let strokeStyle = StrokeStyle(color:Color(.orange))
        let lineWidth = LineWidth(width:5)
        canvas.render(strokeStyle, lineWidth, scoreBoard)
    }}                                 
