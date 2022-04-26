import Igis
import Scenes

class Score: RenderableEntity {
    var rectangle: Rectangle
    var scoreBoard: Rectangle
    init() {
    //    rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
//        let rectangle = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
  //      scoreBoard = Rectangle(rect:rectangle, fillMode:.fillAndStroke)       
        super.init()
    }
    
    override func render(canvas:Canvas) {
        let rect = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
        let scoreBoard = Rectangle(rect:rect, fillMode:.stroke)
        let scorestrokeStyle = StrokeStyle(color:Color(.orange))
        let scorefillStyle = FillStyle(color:Color(.red))
        let scorelineWidth = LineWidth(width:5)
        canvas.render(scorestrokeStyle, scorefillStyle, scorelineWidth, scoreBoard)
    }
}
