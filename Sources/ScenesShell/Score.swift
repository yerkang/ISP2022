import Igis
import Scenes

class Score: RenderableEntity {
<<<<<<< HEAD
    

    init(rect:Rect) {
=======
    var rectangle: Rectangle
    var scoreBoard: Rectangle
    init() {
>>>>>>> 6b8db41eed63939c11cf11190d177e31e3f61d58
    //    rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
//        let rectangle = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
  //      scoreBoard = Rectangle(rect:rectangle, fillMode:.fillAndStroke)       
        super.init()
    }
    
    override func render(canvas:Canvas) {
<<<<<<< HEAD
        let scoreBoardRect = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
        let scoreBoard = Rectangle(rect: scoreBoardRect, fillMode: .fillAndStroke)
        let strokeStyle = StrokeStyle(color:Color(.orange))
        let lineWidth = LineWidth(width:5)
        canvas.render(strokeStyle, lineWidth, scoreBoard)
    }}                                 
=======
        let rect = Rect(topLeft:Point(x:100, y:50), size:Size(width:200, height:300))
        let scoreBoard = Rectangle(rect:rect, fillMode:.stroke)
        let scorestrokeStyle = StrokeStyle(color:Color(.orange))
        let scorefillStyle = FillStyle(color:Color(.red))
        let scorelineWidth = LineWidth(width:5)
        canvas.render(scorestrokeStyle, scorefillStyle, scorelineWidth, scoreBoard)
    }
}
>>>>>>> 6b8db41eed63939c11cf11190d177e31e3f61d58
